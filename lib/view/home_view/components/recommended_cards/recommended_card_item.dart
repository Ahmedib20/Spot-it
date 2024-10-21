import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:get/get.dart';

import 'package:spot_it/controllers/like_button_controller.dart';

import 'package:spot_it/core/widgets/buttons/recom_like_butotn.dart';
import 'package:spot_it/model/place.dart';
import 'package:spot_it/view/home_view/components/recommended_cards/place_info_section.dart';

class RecoCardItem extends StatelessWidget {
  final Place place;
  const RecoCardItem({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Card Image
        Expanded(
          flex: 1,
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              image: DecorationImage(
                image: AssetImage(place.imageUrl!),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const Gap(8),
        // Place Name & Pace address Section
        Expanded(
            flex: 2,
            child: PlaceInfoSection(
              placeName: place.placeName!,
              address: place.address!,
              rating: place.rating!,
            )),
        // Place Rating and Like Button Section
        Expanded(
          flex: 1,
          child: GetBuilder<LikeButtonController>(
            init: LikeButtonController(),
            builder: (controller) {
              debugPrint('${place.isLiked}');
              return RecomLikeButotn(
                onPressed: () {
                  controller.toggleLikeAndSync(place);
                },
                isLiked: place.isLiked,
              );
            },
          ),
        )
      ],
    );
  }
}
