import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SizeConfig extends GetxController {
  double? _screenWidth;
  double? _screenHeight;
  double? defaultSize;
  Orientation? _orientation;
  @override
  void onInit() {
    super.onInit();
    init();
  }

  void init() {
    _screenHeight = Get.height;
    _screenWidth = Get.width;
    _orientation = Get.context!.orientation;

    debugPrint(_orientation.toString());

    defaultSize = _orientation == Orientation.landscape
        ? _screenHeight! * .024
        : _screenWidth! * .024;

    debugPrint('this is the Defaultsize $defaultSize');
  }

  double horizontalPadding() {
    return defaultSize! * 2.7;
  }
}
