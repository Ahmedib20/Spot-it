import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spot_it/core/constants/constants.dart';
import 'package:spot_it/core/utils/size_config.dart';
import 'package:spot_it/model/place.dart';
import 'package:spot_it/view/home_view/components/recommended_cards/recommended_card_item.dart';

class RecommendedCard extends StatelessWidget {
  final Place place;

  const RecommendedCard({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    //~~~~ initial Size config
    SizeConfig sizeConfig = Get.find();
    return InkWell(
      // Route To Place Details With Passing Place Object
      onTap: () {
        Get.toNamed('/detailsView', arguments: {
          'place': place,
        });
      },
      child: Container(
        height: sizeConfig.defaultSize! * 10,
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          color: kRecoCardsColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              blurRadius: 4,
              offset: Offset(1, 2),
              color: k6thColor,
            )
          ],
        ),

        // Card Item
        child: RecoCardItem(place: place),
      ),
    );
  }
}
