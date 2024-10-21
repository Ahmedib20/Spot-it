import 'package:flutter/material.dart';

import 'package:spot_it/view/boarding_view/components/onboarding_body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(),
      body: const OnBoardingBody(),
    );
  }
}
