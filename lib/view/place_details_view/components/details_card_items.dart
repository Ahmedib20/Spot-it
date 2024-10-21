import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spot_it/controllers/like_button_controller.dart';
import 'package:spot_it/core/widgets/buttons/like_button.dart';
import 'package:spot_it/model/place.dart';
import 'package:spot_it/view/home_view/components/place_cards/card_item.dart';

import 'package:spot_it/view/place_details_view/components/back_button.dart';

class DetailsCardItems extends StatelessWidget {
  final Place place;
  const DetailsCardItems({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //Card Like Button
        Align(
          alignment: Alignment.topRight,
          child: GetBuilder<LikeButtonController>(
            init: LikeButtonController(),
            builder: (controller) => LikeButton(
              isLiked: place.isLiked,
              onPressed: () {
                controller.toggleLikeAndSync(place);
              },
            ),
          ),
        ),
        // Back Button
        Align(
          alignment: Alignment.topLeft,
          child: CustomBackButton(
            onPressed: () {
              Get.back();
            },
          ),
        ),

        Align(
          alignment: Alignment.bottomLeft,
          child: CardItem(place: place),
        )
      ],
    );
  }
}
