import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spot_it/core/constants/constants.dart';
import 'package:spot_it/core/widgets/dialogs/dialog_body.dart';
import 'package:spot_it/core/widgets/dialogs/dialog_types_extension.dart';

showCustomDialog({required DialogType type, required String message}) {
  Get.defaultDialog(
    buttonColor: kSecColor,
    title: type.title,
    content: DialogBody(type: type, message: message),
    contentPadding: const EdgeInsets.all(15),
    onConfirm: Get.back,
  );
}

void showLoadingDialog() {
  Get.defaultDialog(
    content: const CircularProgressIndicator(
      color: Colors.blue,
    ),
    backgroundColor: Colors.transparent,
    title: '',
  );
}
