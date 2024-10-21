import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spot_it/core/constants/constants.dart';
import 'package:spot_it/core/utils/size_config.dart';

class SignButton extends StatelessWidget {
  final void Function()? onPressed;
  final bool isEnabled;
  final String text;
  const SignButton({
    super.key,
    required this.isEnabled,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConfig = Get.find();
    return MaterialButton(
      onPressed: isEnabled ? onPressed : null,
      //~~button shape
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13),
      ),
      //~~Button color
      color: kSecColor,
      disabledColor: k6thColor,
      //~~~ text color
      textColor: Colors.white,

      //~~button size
      minWidth: sizeConfig.defaultSize! * 34,
      padding: EdgeInsets.all(sizeConfig.defaultSize! * 1.8),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Roboto-Medium',
          fontSize: sizeConfig.defaultSize! * 1.8,
        ),
      ),
    );
  }
}
