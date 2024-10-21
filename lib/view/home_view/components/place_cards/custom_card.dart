import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:spot_it/controllers/like_button_controller.dart';
import 'package:spot_it/core/utils/size_config.dart';
import 'package:spot_it/core/widgets/buttons/like_button.dart';

import 'package:spot_it/model/place.dart';
import 'package:spot_it/view/home_view/components/place_cards/card_item.dart';

class CustomCard extends StatelessWidget {
  final Place place;
  final double? height;
  const CustomCard({
    super.key,
    required this.place,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    //
    SizeConfig sizeConfig = Get.find();
    //
    LikeButtonController likeController = Get.put(LikeButtonController());
    return InkWell(
      // ~~~ Route to details with passing
      // ~~ the place aas an argument
      onTap: () => Get.toNamed(
        '/detailsView',
        arguments: {
          'place': place,
        },
      ),

      //~~~~ Card Style
      child: Container(
        alignment: Alignment.bottomCenter,
        //
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 10,
        ),

        height: height ?? 0.0,
        width: sizeConfig.defaultSize! * 25,
        // ~~~
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              place.imageUrl!,
            ),
          ),
        ),
        child: Stack(
          // like button
          children: [
            Align(
              alignment: Alignment.topRight,
              //
              child: GetBuilder<LikeButtonController>(
                builder: (controller) {
                  debugPrint('${place.isLiked}');
                  return LikeButton(
                    onPressed: () {
                      likeController.toggleLikeAndSync(place);
                    },
                    isLiked: place.isLiked,
                  );
                },
              ),
            ),

            /// item content
            Align(
              alignment: Alignment.bottomCenter,
              child: CardItem(place: place),
            ),
          ],
        ),
      ),
    );
  }
}
