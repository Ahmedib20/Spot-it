import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:spot_it/core/constants/constants.dart';
import 'package:spot_it/core/utils/settings_services.dart';

class OnboardingController extends GetxController {
  PageController? pageController;
  bool isGetStarted = false;
  bool visiable = true;
  SettingsServices cont = Get.put(SettingsServices());

  List<String> mockUpPhotos = [kExploreMoc, kMapMoc, kDirectionsMoc];

  List<String> titles = [
    'Explore Nearby Places',
    'Interactive Map',
    'Directions',
  ];
  List<String> descs = [
    //~~~Explorer
    "Find popular spots, restaurants, and attractions"
        "around your current location with"
        "ease, tailored just for you",

    //~~~Map
    "Use Google map to explore "
        "the city, zoom in and"
        "out, and get a comprehensive view of"
        "the places you're interested in.",
    //~~Direction
    "Get accurate, live updates on your "
        "location and directions"
        "to reach your destination"
  ];

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 0)
      ..addListener(() {
        isGetStartedSetter();
        initVisable();
        update();
      });
  }

  void isGetStartedSetter() {
    if (pageController!.hasClients) {
      if (pageController!.page == 2) {
        isGetStarted = true;
        update();
      } else {
        isGetStarted = false;
        update();
      }
    }
  }

  void initVisable() {
    if (pageController!.hasClients) {
      if (pageController!.page == 2) {
        visiable = false;
      } else {
        visiable = true;
      }
    }
  }

  void nextPage() {
    if (pageController!.page != 2) {
      pageController!.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );
    } else {
      saveOnBoardingStatus();
      Get.offAllNamed('/signin');
    }
  }

  void skip() {
    pageController!.animateToPage(
      2,
      duration: const Duration(milliseconds: 450),
      curve: Curves.easeIn,
    );
  }

  void saveOnBoardingStatus() {
    cont.prefs.setBool('haveSeenOnBoarding', true);
  }

  bool? haveSeenOnboarding() {
    return cont.prefs.getBool('haveSeenOnBoarding');
  }
}
