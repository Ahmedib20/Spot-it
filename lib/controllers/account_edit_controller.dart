import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:spot_it/auth/presentation/manager/signout_controller.dart';

import 'package:spot_it/core/widgets/dialogs/dialog_types_extension.dart';
import 'package:spot_it/core/widgets/dialogs/show_dialog.dart';

class AccountEditController extends GetxController {
  User? user;

  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  String imageUrl = '';

  String oldEmail = '';
  String oldFullName = '';

  bool updateButtonEnabled = false;

  File? pickedImage;

  final ImagePicker picker = ImagePicker();

  // create instance of firebase firestore
  // to update the user's documnet
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  // create instance of firebase storage
  // to update user's profile picture
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  // initial the sign out controller
  //
  final SignoutController _signoutController = Get.put(SignoutController());

  @override
  void onInit() {
    super.onInit();
    user = Get.arguments['user'];
    setTheUserInfo();
  }

  void setTheUserInfo() {
    try {
      fullName.text = user!.displayName!;
      email.text = user!.email!;
      imageUrl = user!.photoURL!;

      oldFullName = user!.displayName!;
      oldEmail = user!.email!;
      update;
    } catch (e) {
      debugPrint('==================${e.toString()}');
    }
  }

  void textFieldnChanged(TextEditingController controller, String value) {
    controller.text = value;
    if (controller.text.isNotEmpty &&
        (controller.text != oldFullName && controller.text != oldEmail)) {
      updateButtonEnabled = true;
    } else {
      updateButtonEnabled = false;
    }
    update();
  }

  //==============
  // Pick The Image
  //=============
  Future<void> pickImage() async {
    try {
      final XFile? imageGalerry =
          await picker.pickImage(source: ImageSource.gallery);

      if (imageGalerry != null) {
        pickedImage = File(imageGalerry.path);

        updateButtonEnabled = true;
      }

      update();
    } catch (e) {
      debugPrint('============From image picker ${e.toString()}');
    }
  }

  Future<void> updateUserProfile() async {
    // show loading dialog
    // while progress

    showLoadingDialog();

    User? currentUser = user;

    DocumentReference docReefrence =
        _firebaseFirestore.collection('users').doc(currentUser!.uid);

    try {
      // check if the there's a pciked image
      if (pickedImage != null) {
        // then update the user profile image
        // Reference Firebase Stoarge
        // where the image will be stored
        Reference storageRef = _firebaseStorage
            .ref()
            .child('profile_pictures/${currentUser.uid}.jpg');
        //pass the reference and picked image to
        // profile image updating method
        // and get the dowload url
        String uploadedImageUrl =
            await updateProfilePicture(storageRef, pickedImage!);

        // then update the user's document

        if (uploadedImageUrl.isNotEmpty) {
          currentUser.updatePhotoURL(uploadedImageUrl);

          await docReefrence.update(
            {
              'profilPicUrl': uploadedImageUrl,
            },
          );
        }
      }

      // then check if the the email address
      // not equal the old eamil
      // or isn't empty
      // otherwise no need to update it
      if (email.text.isNotEmpty && email.text != oldEmail) {
        //
        currentUser.verifyBeforeUpdateEmail(email.text.trim());

        await docReefrence.update(
          {
            'email': email.text.trim(),
          },
        );

        showCustomDialog(
            type: DialogType.warning,
            message:
                'Please verify your email, \n after verification will be updated');
      }
      // the same with the user's name
      if (fullName.text.isNotEmpty && fullName.text != oldFullName) {
        //
        currentUser.updateDisplayName(fullName.text);

        await docReefrence.update(
          {
            'username': fullName.text,
          },
        );
      }

      // pop the loading indicator after the update
      Get.back();

      Get.snackbar(
        '🥳',
        'Updated successfully',
        duration: const Duration(
          seconds: 1,
        ),
      );

      // finally disapled confirm update button
      updateButtonEnabled = !updateButtonEnabled;

      update();
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<String> updateProfilePicture(Reference storageRef, File image) async {
    try {
      // update the image overwriting
      // the old image
      await storageRef.putFile(image);

      // then get the uploaded image url

      String uploadedImageUrl = await storageRef.getDownloadURL();

      // return the uploaded image url
      return uploadedImageUrl;
    } catch (e) {
      //
      debugPrint('====================ref: ${e.toString()}');
      return '';
    }
  }

  // delete user account
  Future<void> deleteAccount() async {
    try {
      // loading indicator
      showLoadingDialog();

      // firstly will remove
      // the user information
      // from users collection
      User currentUser = user!;

      // then delete the user
      // profile picture
      DocumentSnapshot docSnapshot = await _firebaseFirestore
          .collection('users')
          .doc(currentUser.uid)
          .get();
      String profileUrl = await docSnapshot.get('profilePicUrl');

      print('=======================profilePicUrl $profileUrl');
      if (profileUrl.isNotEmpty) {
        await deleteProfilePicFromStorage(currentUser.uid);
      }

      // delete the user information
      // from users collection

      await _firebaseFirestore
          .collection('users')
          .doc(currentUser.uid)
          .delete();

      // then remove the user
      // uid from likedBy fields
      // of liked places collection

      await removeUserFromLikedBy(currentUser.uid);

      // then remove the user from
      // auth
      await currentUser.delete();

      //pop the loading indicator
      Get.back();

      // then sign the user out
      _signoutController.signOut();

      Get.snackbar(
        '',
        'Deleted successfully.',
        duration: const Duration(
          seconds: 1,
        ),
      );

      debugPrint('user deleted successfully');
    } catch (e) {
      Get.snackbar(
        '',
        'Something went wrong, try again later.',
        duration: const Duration(
          seconds: 1,
        ),
      );
      //pop the loading indicator
      Get.back();
      debugPrint('======from delete account ${e.toString()}');
    }
  }

  // remove the user id from the
  // liked by field of liked places

  Future<void> removeUserFromLikedBy(String userId) async {
    try {
      // query all documents in the collection
      //
      QuerySnapshot querySnapshot =
          await _firebaseFirestore.collection('likedPlaces').get();

      // Iterate through each document
      // and remove the value from
      // the field
      for (var doc in querySnapshot.docs) {
        // remove the value from the field
        await doc.reference.update(
          {
            'likedBy': FieldValue.arrayRemove([userId]),
          },
        );
        debugPrint('user deleted successfully from liked by');
      }
    } catch (e) {
      throw ('======= from liked by remover : ${e.toString()}');
    }
  }

  Future<void> deleteProfilePicFromStorage(String userId) async {
    try {
      // create a reference to the file
      // to be deleted
      Reference storageReference =
          _firebaseStorage.ref().child('profile_pictures/$userId.jpg');

      // delete the profile picture

      await storageReference.delete();

      //
      debugPrint('image deleted successfully');
    } catch (e) {
      throw ('======= from image remover : ${e.toString()}');
    }
  }

  // show a dialog to the user
  // to confirm the deletion
  void showConfirmationDialog() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(20),
      textConfirm: 'Yes',
      title: '',
      middleText: 'Are you sure you want to delete your account?',
      onCancel: () {},
      onConfirm: deleteAccount,
    );
  }
}
