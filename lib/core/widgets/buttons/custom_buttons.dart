import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spot_it/core/constants/constants.dart';
import 'package:spot_it/core/utils/size_config.dart';

class OnBoardingButton extends StatelessWidget {
  final bool isGetStarted;
  final VoidCallback onPressed;
  const OnBoardingButton({
    super.key,
    requ,
    required this.onPressed,
    required this.isGetStarted,
  });

  @override
  Widget build(BuildContext context) {
    // initailize the default size
    SizeConfig controller = Get.find();
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: onPressed,
      child: AnimatedContainer(
        alignment: Alignment.center,
        width: isGetStarted
            ? controller.defaultSize! * 14
            : controller.defaultSize! * 6,
        height: controller.defaultSize! * 6,
        duration: const Duration(
          milliseconds: 200,
        ),
        curve: Curves.easeOut,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(isGetStarted ? 20 : 50),
          gradient: LinearGradient(
            colors: isGetStarted
                ? [kFirstColor, kSecColor]
                : [k3rdColor, kSecColor],
          ),
        ),
        child: isGetStarted
            ? const Text(
                'Get Started',
                style: TextStyle(
                  color: Colors.white,
                ),
              )
            : const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.white,
              ),
      ),
    );
  }
}
