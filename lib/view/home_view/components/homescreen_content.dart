import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:spot_it/controllers/get_places_controller.dart';
import 'package:spot_it/core/constants/constants.dart';
import 'package:spot_it/core/utils/size_config.dart';
import 'package:spot_it/core/widgets/buttons/search_field.dart';
import 'package:spot_it/core/widgets/categories_buttons_list.dart';
import 'package:spot_it/core/widgets/headings_text.dart';
import 'package:spot_it/view/home_view/components/place_cards/cards_list.dart';
import 'package:spot_it/view/home_view/components/current_location_text.dart';
import 'package:spot_it/view/home_view/components/recommended_cards/recommended_list.dart';

class HomescreenContent extends StatelessWidget {
  const HomescreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    //~~~~ initial Size config
    SizeConfig sizeConfig = Get.put(SizeConfig());
    // ~~~~ initial places controller
    GetPlacesController placesController = Get.find();

    // ~~~~
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(
        horizontal: sizeConfig.defaultSize! * 1.8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(sizeConfig.defaultSize! * 1.5),

          // ~~~~ Curreent User Location will be shown here
          Obx(
            () => Skeletonizer(
              enabled: placesController.isLoading.value,
              child: CurrentLocationText(
                text: placesController.placeName.value,
              ),
            ),
          ),
          Gap(sizeConfig.defaultSize! * 3),

          // ~~~~ Search Field
          Padding(
            // Add horizontal padding to the search field
            padding: EdgeInsets.symmetric(
              horizontal: sizeConfig.defaultSize! * 1.8,
            ),
            child: SearchField(
              isFilled: false,
              onPressed: () {},
            ),
          ),

          // ~~~~~ Categories buttons list
          Gap(sizeConfig.defaultSize! * 3),

          //~~~~~ Categories
          const CategoriesButtonsList(),

          // ~~~~~
          Gap(sizeConfig.defaultSize! * 2),

          // ~~~ Nearby Cards list Section
          //~~~~~~~~~~~~~~~
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const HeadingsText(text: 'Near you'),

              //
              TextButton(
                onPressed: () {
                  Get.toNamed('/viewAll');
                },
                child: const Text(
                  'View all',
                  style: TextStyle(
                    color: k5thColor,
                  ),
                ),
              )
            ],
          ),
          //~~~~~ space between cards list and Near you text
          Gap(sizeConfig.defaultSize! * 1.5),
          // `~~~ the list of cards
          Obx(
            () => Skeletonizer(
              enabled: placesController.isLoading.value,
              child: const CardsList(),
            ),
          ),
          // ~~~
          Gap(sizeConfig.defaultSize! * 1.5),

          //~~~~Recommended Section
          const HeadingsText(text: 'Recommended'),
          //~~~~~~ space between cards list and Recommended text
          Gap(sizeConfig.defaultSize! * 1.5),
          // ~~~ Recommended List
          Obx(
            () => Skeletonizer(
              enabled: placesController.isLoading.value,
              child: const RecommendedList(),
            ),
          ),
        ],
      ),
    );
  }
}
