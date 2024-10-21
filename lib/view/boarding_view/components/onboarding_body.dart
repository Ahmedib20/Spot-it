import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:spot_it/controllers/onboarding_controller.dart';
import 'package:spot_it/core/constants/constants.dart';
import 'package:spot_it/core/utils/size_config.dart';
import 'package:spot_it/core/widgets/buttons/custom_buttons.dart';

import 'package:spot_it/view/boarding_view/components/custom_pageview.dart';
import 'package:spot_it/view/boarding_view/components/skip_button.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({super.key});

  @override
  Widget build(BuildContext context) {
    //
    OnboardingController onBoardingController = Get.put(OnboardingController());
    // initail Size Config
    SizeConfig controller = Get.put(SizeConfig(), permanent: true);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: controller.defaultSize! * 3.5,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Space From The Top Screen
          Gap(controller.defaultSize! * .3),

          //~~~~~~~~~~~
          // Skip Button
          //~~~~~~~~~~~~
          Align(
            alignment: Alignment.topRight,
            child: GetBuilder<OnboardingController>(
              builder: (context) {
                return SkipButton(
                  isButtonVisiabl: onBoardingController.visiable,
                  onPressed: onBoardingController.skip,
                );
              },
            ),
          ),

          // Space Between Skip Button And Page View
          Gap(controller.defaultSize! * 6),
          //~~~~~~~~~~
          // On Boarding Items
          CustomPageView(
            pageController: onBoardingController.pageController!,
          ),

          //~~~~~~Indicator
          Gap(controller.defaultSize! * 9),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SmoothPageIndicator(
                controller: onBoardingController.pageController!,
                count: 3,
                effect: ExpandingDotsEffect(
                  activeDotColor: kSecColor,
                  dotWidth: controller.defaultSize!,
                  dotHeight: controller.defaultSize! * .8,
                ),
              ),
              GetBuilder<OnboardingController>(builder: (context) {
                return OnBoardingButton(
                  isGetStarted: onBoardingController.isGetStarted,
                  onPressed: onBoardingController.nextPage,
                );
              }),
            ],
          ),
        ],
      ),
    );
  }
}
