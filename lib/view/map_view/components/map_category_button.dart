import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:spot_it/core/constants/constants.dart';
import 'package:spot_it/core/utils/size_config.dart';

class MapCategoryButton extends StatelessWidget {
  final void Function() onTap;
  final String? svgImage;
  final String? text;
  final bool isSelected;
  const MapCategoryButton({
    super.key,
    required this.onTap,
    this.svgImage,
    this.text,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConfig = Get.find();

    return MaterialButton(
      elevation: 3,
      // The Shape Of The Button
      padding: EdgeInsets.symmetric(
        horizontal: sizeConfig.defaultSize! * 1.5,
        vertical: sizeConfig.defaultSize! * 1.3,
      ),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      // On Pressed Function
      onPressed: onTap,
      // button Color
      color: isSelected ? k3rdColor : kunSelectedButton,
      // The Text Widget
      child: Row(
        children: [
          SvgPicture.asset(
            svgImage!,
            // ignore: deprecated_member_use
            color: isSelected ? Colors.white : kDisabledText,
          ),
          Text(
            text!,
            style: TextStyle(
              color: isSelected ? Colors.white : kDisabledText,
              fontFamily: 'Roboto-Medium',
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }
}
