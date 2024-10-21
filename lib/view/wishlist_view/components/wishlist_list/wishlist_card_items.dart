import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:spot_it/controllers/wishlist_controller.dart';

import 'package:spot_it/core/widgets/buttons/recom_like_butotn.dart';
import 'package:spot_it/model/place.dart';
import 'package:spot_it/view/home_view/components/recommended_cards/place_info_section.dart';

class WishlistCardItems extends StatelessWidget {
  final Place place;
  const WishlistCardItems({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Card Image
        Expanded(
          flex: 1,
          child: Container(
            // Image Card size
            width: 80,
            height: 80,
            //  Image Card decoration
            decoration: BoxDecoration(
              // Card Border
              borderRadius: BorderRadius.circular(13),
              // Card Image
              image: DecorationImage(
                image: AssetImage(place.imageUrl!),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        //
        const Gap(8),

        // Place Name & Pace address Section
        Expanded(
          flex: 2,
          child: PlaceInfoSection(
            placeName: place.placeName!,
            address: place.address!,
            rating: place.rating!,
          ),
        ),
        // Place Rating and Like Button Section
        Expanded(
          flex: 1,

          // Used Recommended Like Button for saving time
          child: GetBuilder<WishlistController>(
            init: WishlistController(),
            builder: (controller) => RecomLikeButotn(
              onPressed: () {
                controller.removePlaceFromWishlist(place);
              },
              isLiked: place.isLiked,
            ),
          ),
        )
      ],
    );
  }
}
