import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:spot_it/controllers/map_controller.dart';
import 'package:spot_it/core/utils/size_config.dart';
import 'package:spot_it/view/map_view/components/map_category_button.dart';

class MapMarkersCategoriesList extends StatelessWidget {
  const MapMarkersCategoriesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //
    SizeConfig sizeConfig = Get.find();

    // Map Controller
    MapController mapController = Get.put(MapController());

    return SizedBox(
      height: sizeConfig.defaultSize! * 6,
      child: ListView.separated(

          //
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          // list length
          itemCount: mapController.categories.length,
          // list padding
          padding: EdgeInsets.symmetric(
              horizontal: sizeConfig.defaultSize! * 4,
              vertical: sizeConfig.defaultSize! * .7),
          // separator
          separatorBuilder: (context, index) =>
              Gap(sizeConfig.defaultSize! * 3),
          // Widget,
          itemBuilder: (context, index) => Obx(
                // Category button
                () => MapCategoryButton(
                  onTap: () {
                    mapController.categoryButtonOnTap(index);
                  },
                  isSelected: mapController.currentIndex.value == index,
                  //
                  svgImage: mapController.categoriesIcons[index],
                  //
                  text: mapController.categories[index],
                ),
              )),
    );
  }
}
