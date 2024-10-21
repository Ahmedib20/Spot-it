import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:spot_it/controllers/bottom_naviagtion_controller.dart';
import 'package:spot_it/core/constants/constants.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNaviagtionController controller = Get.put(
      BottomNaviagtionController(),
      permanent: true,
    );
    return Scaffold(
      //
      bottomNavigationBar: Obx(
        () => NavigationBar(
          // navigation bar height
          height: 70,
          // elevation of the navigation bar
          elevation: 0,
          // color of the navigation bar
          backgroundColor: kAppBarColor,
          //
          selectedIndex: controller.slectedIndex.value,
          //
          onDestinationSelected: (value) =>
              controller.destinationSelected(value),

          // list of destination icons

          destinations: List.generate(
            //length of the list
            controller.destinationToolTips.length,

            (index) => NavigationDestination(
              tooltip: controller.destinationToolTips[index],
              icon: SvgPicture.asset(
                controller.navigationDestinationIcons[index],
              ),
              label: '',
            ),
          ),
        ),
      ),
      body: Obx(
        () => controller.screens[controller.slectedIndex.value],
      ),
    );
  }
}
