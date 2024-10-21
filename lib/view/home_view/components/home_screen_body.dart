import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:spot_it/controllers/get_places_controller.dart';

import 'package:spot_it/view/home_view/components/denied_permission.dart';
import 'package:spot_it/view/home_view/components/homescreen_content.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    GetPlacesController placesController = Get.put(GetPlacesController());

    return Obx(
      () {
        // ~~~~~~ Check The Permission
        if (placesController.hasPermission.value == false) {
          // ~~~~~ if permissions are not granted
          //then show error message

          return Center(
            child: ErrorContent(
              buttonText: 'Refresh',
              text:
                  'Please allow the permissions so you \n can get our services',
              onPressed: placesController.requestPermission,
            ),
          );
        }

        // ~~~~ check the location services
        if (!placesController.isServicesEnabled.value) {
          return Center(
            child: ErrorContent(
              onPressed: placesController.checkServicesEnabled,
              text:
                  'Please enable the location services \n so you can get our services.',
              buttonText: 'Refresh',
            ),
          );
        }

        // ~~~~~~ if permission is granted and the location services
        // is enabled then show the home screen content

        return const HomescreenContent();
      },
    );
  }
}
