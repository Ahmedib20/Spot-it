import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spot_it/core/widgets/dialogs/dialog_types_extension.dart';
import 'package:spot_it/core/widgets/dialogs/show_dialog.dart';

class ResetPasswordController extends GetxController {
  // initial the email text field controller
  TextEditingController email = TextEditingController();

  // create firebase auth instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //~~~
  bool isEmailValid = false;

  Future<void> sendResetPasswordLink() async {
    // Showing Indicator While Progressing the send reset link
    Get.defaultDialog(
      content: const CircularProgressIndicator(
        color: Colors.blue,
      ),
      backgroundColor: Colors.transparent,
      title: '',
    );
    try {
      //~~~~~~~~~ Send Link
      await _auth.sendPasswordResetEmail(email: email.text.trim());
      //~~~~~ Clear email field
      email.clear();
      //~~~~ pop the loading dialog
      Get.back();
      //~~~ Show sucess dialog

      showCustomDialog(
        type: DialogType.success,
        message: 'Sent successfuly, let\'s to \n check your mails',
      );
    } on FirebaseAuthException catch (e) {
      showCustomDialog(
        type: DialogType.error,
        message: e.code,
      );
    } catch (e) {
      showCustomDialog(
        type: DialogType.error,
        message: 'Sorry 😔, something went wrong.',
      );
    }
  }

  // To check if the email field is not empty
  void validateEmail(String text) {
    email.text = text;
    if (email.text.isNotEmpty &&
        email.text.contains('@') &&
        email.text.contains('mail') &&
        email.text.contains('.')) {
      isEmailValid = true;
    } else {
      isEmailValid = false;
    }
    update();
  }
}
