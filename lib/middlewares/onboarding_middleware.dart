import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spot_it/controllers/onboarding_controller.dart';

class OnboardingMiddleware extends GetMiddleware {
  OnboardingController controller = Get.put(OnboardingController());
  final User? user = FirebaseAuth.instance.currentUser;
  @override
  RouteSettings? redirect(String? route) {
    if (controller.haveSeenOnboarding() == true && user != null) {
      return const RouteSettings(name: '/navigation');
    } else if (controller.haveSeenOnboarding() == true) {
      return const RouteSettings(name: '/signin');
    }
    return null;
  }
}
