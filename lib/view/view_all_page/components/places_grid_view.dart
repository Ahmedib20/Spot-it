import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:spot_it/controllers/get_places_controller.dart';
import 'package:spot_it/core/utils/size_config.dart';
import 'package:spot_it/model/place.dart';
import 'package:spot_it/view/home_view/components/place_cards/custom_card.dart';

class PlacesGridView extends StatelessWidget {
  const PlacesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    //
    GetPlacesController getPlacesController = Get.put(GetPlacesController());
    SizeConfig sizeConfig = Get.find();
    //
    return MasonryGridView.builder(
      //
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: getPlacesController.selectedCategory.length,
      itemBuilder: (context, index) {
        Place place = getPlacesController.selectedCategory[index];
        // card
        return CustomCard(
          height: index.isEven
              ? sizeConfig.defaultSize! * 35
              : sizeConfig.defaultSize! * 28,
          place: place,
        );
      },
    );
  }
}
