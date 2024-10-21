import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spot_it/controllers/details_view_controller.dart';
import 'package:spot_it/core/utils/size_config.dart';
import 'package:spot_it/view/place_details_view/components/details_content.dart';
import 'package:spot_it/view/place_details_view/components/show_on_map_button.dart';

class PlaceDetailsBody extends StatelessWidget {
  const PlaceDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    //~~~~~~~~Intialize the Size Config object
    SizeConfig sizeConfig = Get.put(SizeConfig());

    // ~~~ inintial details controller
    // to get the place argument that passed
    // from home sacreen
    DetailsViewController detailsViewController =
        Get.put(DetailsViewController());

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: sizeConfig.defaultSize! * 3,
        vertical: sizeConfig.defaultSize! * 1.5,
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),

            // Details content widget
            child: DetailsContent(
              place: detailsViewController.place,
            ),
          ),
          // Show on map button
          Align(
            widthFactor: .3,
            alignment: Alignment.bottomCenter,
            child: ShowOnMapButton(
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
