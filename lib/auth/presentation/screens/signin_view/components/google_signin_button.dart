import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:spot_it/core/constants/constants.dart';
import 'package:spot_it/core/utils/size_config.dart';

class GoogleSigninButton extends StatelessWidget {
  final void Function()? onPressed;
  const GoogleSigninButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConfig = Get.find();
    return MaterialButton(
      onPressed: onPressed,
      //~~ Button Shape
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13),
        side: const BorderSide(
          width: .3,
          color: kOffWhite,
        ),
      ),
      // ~~~ Elevation
      elevation: 10,
      // Button Color
      color: Colors.white,
      // ~~ Button Size
      minWidth: sizeConfig.defaultSize! * 34,
      padding: EdgeInsets.all(sizeConfig.defaultSize! * 1.8),
      // ~~ Button contents
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(kGoogleIcon),
          Gap(sizeConfig.defaultSize! * .8),
          const Text(
            'Sign in with Google',
          )
        ],
      ),
    );
  }
}
