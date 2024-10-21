import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:spot_it/core/constants/constants.dart';
import 'package:spot_it/core/utils/size_config.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final String prefixIcon;
  final Color prefixIconColor;
  final void Function(String)? onChanged;
  final String suffixIcon;
  final bool isObsecured;
  final bool isPassword;
  final void Function()? isObsecuredButton;
  final bool isEmail;

  const CustomTextfield({
    super.key,
    required this.textController,
    required this.hintText,
    required this.prefixIcon,
    required this.onChanged,
    required this.prefixIconColor,
    this.suffixIcon = kEyeClosed,
    this.isObsecured = false,
    this.isPassword = false,
    this.isObsecuredButton,
    this.isEmail = false,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConfig = Get.put(SizeConfig());

    return TextFormField(
      keyboardType:
          isEmail == true ? TextInputType.emailAddress : TextInputType.text,
      maxLines: 1,
      obscureText: isObsecured,
      controller: textController,
      decoration: InputDecoration(
        // content Padding
        contentPadding: EdgeInsets.symmetric(
          horizontal: sizeConfig.defaultSize! * 1,
          vertical: sizeConfig.defaultSize! * 1.7,
        ),

        //~~~` Boredr Style
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),

        //~~~~~~~~~ hint Text
        hintText: hintText,
        hintStyle: TextStyle(
          fontFamily: 'Roboto',
          color: k5thColor,
          fontSize: sizeConfig.defaultSize! * 1.5,
        ),

        // ~~~~ Prefix Icon

        prefixIcon: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: sizeConfig.defaultSize! * 1),
          child: SvgPicture.asset(
            // ignore: deprecated_member_use
            color: prefixIconColor,
            prefixIcon,
          ),
        ),
        //~~~~~ Suffix Icon
        suffixIcon: isPassword
            ? //~~~~~~~~ if password is set true then show the the suffix icon
            CupertinoButton(
                onPressed: isObsecuredButton,
                child: SvgPicture.asset(suffixIcon),
              )
            //~~~~~~~else
            : const SizedBox(),

        //~~~~~~~~Filled Color
        filled: true,
        fillColor: kFieldTextColor,
      ),
      // ~~~` onChanged
      onChanged: onChanged,
    );
  }
}
