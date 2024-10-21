import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spot_it/controllers/onboarding_controller.dart';

import 'package:spot_it/core/utils/size_config.dart';

import 'package:spot_it/view/boarding_view/components/pageview_item.dart';

class CustomPageView extends StatelessWidget {
  final PageController pageController;
  const CustomPageView({
    super.key,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    // initial size config
    SizeConfig controller = Get.find();

    // on boarding controller
    OnboardingController onboardingController = Get.find();
    return Column(
      children: [
        SizedBox(
          height: controller.defaultSize! * 43,
          width: controller.defaultSize! * 43,
          child: PageView.builder(
            itemCount: 3,
            controller: pageController,
            itemBuilder: (context, i) => PageViewItem(
              image: onboardingController.mockUpPhotos[i],
              title: onboardingController.titles[i],
              desc: onboardingController.descs[i],
            ),
          ),
        ),
      ],
    );
  }
}
