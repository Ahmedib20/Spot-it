import 'package:flutter/material.dart';
import 'package:spot_it/core/constants/constants.dart';
import 'package:spot_it/view/splash_view/components/sub_splash_body.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            kSecColor,
            kFirstColor,
          ],
        ),
      ),
      child: const SubBody(),
    );
  }
}
