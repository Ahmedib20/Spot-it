import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:spot_it/controllers/get_places_controller.dart';
import 'package:spot_it/controllers/home_controller.dart';
import 'package:spot_it/core/utils/size_config.dart';
import 'package:spot_it/model/place.dart';
import 'package:spot_it/view/home_view/components/place_cards/custom_card.dart';

class CardsList extends StatelessWidget {
  const CardsList({super.key});

  @override
  Widget build(BuildContext context) {
    // ~~~~ initial size configuration
    SizeConfig sizeConfig = Get.find();
    // ~~~~ get places controller
    GetPlacesController placesController = Get.find();

    //
    HomeController homeController = Get.find();

    return SizedBox(
      height: sizeConfig.defaultSize! * 39,
      child: Obx(
        () => ListView.separated(
          padding: EdgeInsets.symmetric(
            vertical: sizeConfig.defaultSize! * .8,
            horizontal: sizeConfig.defaultSize! * .8,
          ),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            Place place = placesController.selectedCategory[index];

            // Places Card
            return CustomCard(
              place: place,
            );
          },
          separatorBuilder: (context, index) => SizedBox(
            width: sizeConfig.defaultSize! * 2,
          ),
          // pass the list length to
          // display appropriate number
          // items

          // check if loading
          // then set the dummy list length
          // otherwise devide the length of the list
          itemCount: placesController.isLoading.value
              ? placesController.selectedCategory.length
              : homeController
                  .devideList(placesController.selectedCategory.length),
        ),
      ),
    );
  }
}
