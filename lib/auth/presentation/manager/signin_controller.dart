import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spot_it/auth/data/repositries/auth_repo_impl.dart';

import 'package:spot_it/core/widgets/dialogs/dialog_types_extension.dart';

import 'package:spot_it/core/widgets/dialogs/show_dialog.dart';

class SignInController extends GetxController {
  // Text Controllers
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController fullName = TextEditingController();

  // An Instance Of Auth Repositiry Implementaion
  final AuthRepoImpl _authRepoImpl = AuthRepoImpl();

  // Firebase Auth Instance
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //~~
  bool isEmailValid = false;
  bool isPasswordValid = false;
  bool isObsecure = true;
  bool buttonEnabled = false;

  // =========================
  // Sign In With email and Password Authintication
  //============================
  Future<void> signIInWithEmailPassword() async {
    try {
      // Showing Indicator While Progressing the Sign in Process
      showLoadingDialog();
      // try to sign in with email and password
      User? user = await _authRepoImpl.signinWithEmailAndPass(
        email: email.text.trim(),
        password: password.text,
      );

      if (user != null) {
        if (_firebaseAuth.currentUser!.emailVerified) {
          // And then pop the circle Indicator
          Get.back();
          // If sign in Successful , route to home
          Get.offNamed('/navigation');
        } else {
          // If The Email is not confirmed

          // Pop the Loading
          Get.back();
          // Show Warnning Dialog
          showCustomDialog(
              type: DialogType.warning,
              message: 'Please Verify Your Email First !');
        }
      }
    } catch (e) {
      // Firstly will pop the indicator
      Get.back();
      // Showing The Custom Dialog From Type Error
      showCustomDialog(
        type: DialogType.error,
        message: e.toString(),
      );
    }
  } // The End Of Sign in Method

  // ==== Sign in With Google Account Section ====

  Future<void> signInWithGoogle() async {
    try {
      // Show Loading Indicator
      showLoadingDialog();
      //===============
      UserCredential userCredential = await _authRepoImpl.signinWithGoogle();
      if (userCredential.user != null) {
        // Firebase Firestore Instance To Get The Users Collection
        // And to Check if the user's exists
        //or not to add em or not
        final FirebaseFirestore firestore = FirebaseFirestore.instance;

        // User instance
        final User user = userCredential.user!;
        // get the user document
        DocumentSnapshot doc =
            await firestore.collection('users').doc(user.uid).get();
        // then check if em not exist
        if (!doc.exists) {
          await firestore.collection('users').doc(user.uid).set(
            {
              'username': user.displayName,
              'email': user.email,
              'createdOn': DateTime.now(),
              'profilePicUrl': '',
              'wishList': [],
            },
          );
          // pop the loading indicator
          Get.back();
          // if signed in successfuly route the user to home page
          Get.offAllNamed('/navigation');
        } else {
          Get.offAllNamed('/navigation');
        }
      }
    } catch (e) {
      // pop the loading indicator
      Get.back();
      showCustomDialog(
        type: DialogType.error,
        message: e.toString(),
      );
    }
  }

  void validateEmail(String text) {
    email.text = text;
    isButtonEnaled();
    if (email.text.isNotEmpty) {
      isEmailValid = true;
    } else {
      isEmailValid = false;
    }
    update();
  }

  void validatePassowrd(String text) {
    password.text = text;
    isButtonEnaled();
    if (password.text.isNotEmpty) {
      isPasswordValid = true;
    } else {
      isPasswordValid = false;
    }
    update();
  }

  isObsecuredText() {
    isObsecure = !isObsecure;
    update();
  }

  void isButtonEnaled() {
    if (isEmailValid == true && isPasswordValid == true) {
      buttonEnabled = true;
    } else {
      buttonEnabled = false;
    }
    update();
  }
}
