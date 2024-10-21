import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spot_it/core/constants/constants.dart';
import 'package:spot_it/core/utils/size_config.dart';
import 'package:spot_it/model/place.dart';
import 'package:spot_it/view/place_details_view/components/details_card_items.dart';

class DetailsCard extends StatelessWidget {
  final Place place;
  const DetailsCard({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConfig = Get.find();
    return Container(
      // Card Size
      height: sizeConfig.defaultSize! * 47,
      width: sizeConfig.defaultSize! * 38,
      // Card Padding
      padding: EdgeInsets.symmetric(
        horizontal: sizeConfig.defaultSize! * 2,
        vertical: sizeConfig.defaultSize! * 2,
      ),
      decoration: BoxDecoration(
        // Border Radius
        borderRadius: BorderRadius.circular(20),
        // Card Shadow
        boxShadow: const [
          BoxShadow(
            color: k5thColor,
            blurRadius: 25,
            offset: Offset(
              2,
              13,
            ),
          )
        ],
        // Card Background Image
        image: DecorationImage(
          image: AssetImage(
            place.imageUrl!,
          ),
          fit: BoxFit.cover,
        ),
      ),
      // Card Content
      child: DetailsCardItems(place: place),
    );
  }
}
