import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:spot_it/core/utils/size_config.dart';
import 'package:spot_it/core/widgets/buttons/search_field.dart';
import 'package:spot_it/view/map_view/components/custom_map.dart';

import 'package:spot_it/view/map_view/components/map_markers_categories.dart';

class GoogleMapView extends StatelessWidget {
  const GoogleMapView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConfig = Get.put(SizeConfig());
    return Stack(
      fit: StackFit.expand,
      children: [
        // First create the google map
        const CustomMap(),

        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Space from top of the screen
            Gap(sizeConfig.defaultSize! * 5),

            // Search field
            Padding(
              // Add horizontal padding to the search field
              padding: EdgeInsets.symmetric(
                horizontal: sizeConfig.defaultSize! * 4,
              ),
              child: SearchField(
                isFilled: true,
                onPressed: () {},
              ),
            ),

            Gap(sizeConfig.defaultSize! * 2),

            // Categories list
            const MapMarkersCategoriesList(),
          ],
        )
      ],
    );
  }
}
