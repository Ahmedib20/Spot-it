import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spot_it/core/constants/constants.dart';
import 'package:spot_it/core/utils/size_config.dart';

class CategoryButton extends StatelessWidget {
  final String? text;
  final void Function()? onPressed;
  final bool? selected;

  const CategoryButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConfig = Get.find();
    return MaterialButton(
      elevation: 4,
      // The Shape Of The Button
      padding: EdgeInsets.symmetric(
        horizontal: sizeConfig.defaultSize! * 1.5,
        vertical: sizeConfig.defaultSize! * 1.3,
      ),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      // On Pressed Function
      onPressed: onPressed,
      // button Color
      color: selected! ? k3rdColor : kunSelectedButton,
      // The Text Widget
      child: Text(
        text!,
        style: TextStyle(
          color: selected! ? Colors.white : kDisabledText,
          fontFamily: 'Roboto-Medium',
          fontSize: 16,
        ),
      ),
    );
  }
}
