import 'package:flutter/material.dart';
import 'package:spot_it/view/splash_view/components/splash_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBodyBehindAppBar: false,
      body: SplashBody(),
    );
  }
}
