import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spot_it/core/constants/constants.dart';

class SubBody extends StatefulWidget {
  const SubBody({super.key});

  @override
  State<SubBody> createState() => _SubBodyState();
}

class _SubBodyState extends State<SubBody> with SingleTickerProviderStateMixin {
  late AnimationController? _animationController;
  late Animation<double>? _fadingAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _fadingAnimation =
        Tween(begin: 0.2, end: 1.0).animate(_animationController!);

    _animationController?.repeat(reverse: true);

    goToNextPage();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: _fadingAnimation!,
              child: const Text(
                'Spot it',
                style: TextStyle(
                  fontFamily: 'Lobster',
                  color: Colors.white,
                  //fontSize: 40,
                ),
                textScaler: TextScaler.linear(3.2),
              ),
            ),
            kGap5,
            Image.asset(
              'assets/logo2.png',
              width: 50.0,
            ),
          ],
        ),
        kGap35,
        const Text(
          'Your Guide For Nearby \n Adventures',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Roboto-Medium',
            //fontSize: 20,
            color: kOffWhite,
          ),
          textScaler: TextScaler.linear(1.1),
        )
      ],
    );
  }

  void goToNextPage() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Get.offNamed(
          '/onBoarding',
        );
      },
    );
  }
}
