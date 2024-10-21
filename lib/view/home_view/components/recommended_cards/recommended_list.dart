import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spot_it/controllers/get_places_controller.dart';
import 'package:spot_it/controllers/home_controller.dart';
import 'package:spot_it/core/utils/size_config.dart';
import 'package:spot_it/model/place.dart';
import 'package:spot_it/view/home_view/components/recommended_cards/recommended_card.dart';

class RecommendedList extends StatelessWidget {
  const RecommendedList({super.key});

  @override
  Widget build(BuildContext context) {
    // initialize size config
    SizeConfig sizeConfig = Get.find();
    // initialize get places controller to
    // get high ratings list
    GetPlacesController getPlacesController = Get.find();

    // init home controller
    HomeController homeController = Get.find();

    return SizedBox(
      height: sizeConfig.defaultSize! * 50,
      child: Obx(
        () => ListView.separated(
          padding: EdgeInsets.symmetric(
            vertical: sizeConfig.defaultSize! * .8,
            horizontal: sizeConfig.defaultSize! * .8,
          ),
          itemBuilder: (context, index) {
            Place place = getPlacesController.highRatingList![index];

            // ~~~~ Recommended Card
            return RecommendedCard(
              place: place,
            );
          },
          separatorBuilder: (context, index) => SizedBox(
            // SpaceBetween Items
            height: sizeConfig.defaultSize! * 2,
          ),

          // check if loading
          // then set the dummy list length
          // otherwise devide the length of the list
          itemCount: getPlacesController.isLoading.value
              ? getPlacesController.highRatingList!.length
              : homeController
                  .devideList(getPlacesController.highRatingList!.length),
        ),
      ),
    );
  }
}
