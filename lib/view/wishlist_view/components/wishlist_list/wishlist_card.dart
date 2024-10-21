import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spot_it/core/constants/constants.dart';
import 'package:spot_it/core/utils/size_config.dart';
import 'package:spot_it/model/place.dart';
import 'package:spot_it/view/wishlist_view/components/wishlist_list/wishlist_card_items.dart';

class WishlistCard extends StatelessWidget {
  final Place place;
  final Function()? onTap;
  const WishlistCard({
    super.key,
    required this.place,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    //~~~~ initial Size config
    SizeConfig sizeConfig = Get.find();
    return InkWell(
      // Route To Place Details With Passing Place Object
      onTap: onTap,
      child: Container(
        // the hieght of the card
        height: sizeConfig.defaultSize! * 10,

        // padding
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 5,
        ),
        // The decoration of teh card
        decoration: BoxDecoration(
          // color background color
          color: kRecoCardsColor,

          // the shape of borders
          borderRadius: BorderRadius.circular(15),

          // Card shadow
          boxShadow: const [
            BoxShadow(
              blurRadius: 4,
              offset: Offset(1, 2),
              color: k6thColor,
            )
          ],
        ),

        // Card Item
        child: WishlistCardItems(
          place: place,
        ),
      ),
    );
  }
}
