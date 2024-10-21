import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:spot_it/auth/data/repositries/auth_repo_impl.dart';
import 'package:spot_it/core/widgets/dialogs/dialog_types_extension.dart';
import 'package:spot_it/core/widgets/dialogs/show_dialog.dart';

class SignupController extends GetxController {
  // TEXT CONTROLLERS
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController fullName = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  // Profile Picture
  File? profilePicture;
  AssetImage initProfilePicture =
      const AssetImage('assets/initProfilePic/person.png');

  // create instance of auth repo impl class
  final AuthRepoImpl _authRepo = AuthRepoImpl();

  // Firebase Auth instance
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //~~
  bool isEmailValid = false;
  bool isPasswordValid = false;
  bool isObsecure = true;
  bool buttonEnabled = false;
  String confirmPasswordValidatorTxet = '';
  bool isConfirmValid = false;
  bool isFullNameValid = false;

  // Create New User
  Future<void> createNewUser() async {
    try {
      // Loading
      showLoadingDialog();
      // creating user
      UserCredential userCredential = await _authRepo.signUp(
        email: email.text,
        password: password.text,
      );

      if (userCredential.user != null) {
        // Store The Profile Picture
        File? pickedProfilePicture = profilePicture;

        // Store The Profile Picture Download Url
        String? profilePictureDownloadUrl;

        if (pickedProfilePicture != null) {
          // Check Picked Picture if it is not null
          profilePictureDownloadUrl = await _uploadProfilePicture(
              userCredential.user, pickedProfilePicture);
        }

        // then add them to the users collection
        await _addAdditionalInfo(userCredential.user, fullName.text, email.text,
            profilePictureDownloadUrl);

        // Send Verify Link To Email
        _sendVerifyLink(_firebaseAuth);
        // if created successfuly
        Get.back();
        showCustomDialog(
          type: DialogType.success,
          message: "Created Successfuly 🥳, \n "
              " We Sent a Verification Link To your Email",
        );
        //~~~~ clear all text controllers
        email.clear();
        password.clear();
        fullName.clear();
        confirmPassword.clear();
      }
    } catch (e) {
      Get.back();
      showCustomDialog(
        type: DialogType.error,
        message: e.toString(),
      );
    }
  }

  // Set The Additional Information to the Firestore Database
  Future<void> _addAdditionalInfo(
    User? user,
    String? fullName,
    String? email,
    String? proPicUrl,
  ) async {
    try {
      // Creat instance of Firebase Firestore class
      final FirebaseFirestore firestore = FirebaseFirestore.instance;

      // firstly will get the user from users collection if exists
      DocumentSnapshot doc =
          await firestore.collection('users').doc(user!.uid).get();

      // then check if the user's already exist
      if (!doc.exists) {
        // check if the documents is'nt exist
        // in the collection
        // and upadte there name and profile url picture
        user.updateDisplayName(fullName);
        user.updatePhotoURL(proPicUrl);
        // Then Add The User To Users Collection
        await firestore.collection('users').doc(user.uid).set(
          {
            'username': fullName,
            'email': user.email,
            'createdOn': DateTime.now(),
            'profilPicUrl': proPicUrl ?? '',
            'wishList': [],
          },
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  //===========
  // Send Verification Link To The User
  //============

  void _sendVerifyLink(FirebaseAuth auth) {
    try {
      if (auth.currentUser != null) {
        auth.currentUser!.sendEmailVerification();
      }
    } catch (e) {
      rethrow;
    }
  }

  //==============
  // Pick The Image
  //=============
  Future<void> pickImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? imageGalerry =
          await picker.pickImage(source: ImageSource.gallery);

      if (imageGalerry != null) {
        profilePicture = File(imageGalerry.path);
      }

      update();
    } catch (e) {
      rethrow;
    }
  }

  // ============
  // Upload Profile Picture to the Storage
  //====================
  Future<String?> _uploadProfilePicture(
    User? user,
    File? profilePicture,
  ) async {
    try {
      String fileName = 'profile_pictures/${user!.uid}.jpg';

      // creating storage reference instance
      var storageRef = FirebaseStorage.instance.ref().child(fileName);

      // Upload The Picture To The Storage
      await storageRef.putFile(profilePicture!);

      // Get the Picture Url
      String downloadUrl = await storageRef.getDownloadURL();

      // Return the Url
      return downloadUrl;
    } catch (e) {
      rethrow;
    }
  }

  void validateEmail(String text) {
    email.text = text;

    if (email.text.contains('@') &&
        email.text.contains('mail') &&
        email.text.contains('.')) {
      isEmailValid = true;
    } else {
      isEmailValid = false;
    }
    isButtonEnaled();
    update();
  }

  void validatePassowrd(String text) {
    password.text = text;

    if (password.text.isNotEmpty) {
      isPasswordValid = true;
    } else {
      isPasswordValid = false;
    }
    isButtonEnaled();
    update();
  }

  isObsecuredText() {
    isObsecure = !isObsecure;
    update();
  }

  void isButtonEnaled() {
    if (isFullNameValid == true &&
        isEmailValid == true &&
        isPasswordValid == true &&
        isConfirmValid == true) {
      buttonEnabled = true;
    } else {
      buttonEnabled = false;
    }
    update();
  }

  void confirmValidator(String text) {
    confirmPassword.text = text;

    if (confirmPassword.text == password.text &&
        confirmPassword.text.isNotEmpty &&
        password.text.isNotEmpty) {
      isConfirmValid = true;
    } else {
      isConfirmValid = false;
    }
    isButtonEnaled();
    update();
  }

  void validateFullName(String text) {
    fullName.text = text;

    if (fullName.text.isNotEmpty) {
      isFullNameValid = true;
    } else {
      isFullNameValid = false;
    }
    isButtonEnaled();
    update();
  }
}
