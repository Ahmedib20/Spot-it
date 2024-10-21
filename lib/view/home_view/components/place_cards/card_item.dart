import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:spot_it/core/constants/constants.dart';
import 'package:spot_it/core/utils/size_config.dart';
import 'package:spot_it/model/place.dart';

class CardItem extends StatelessWidget {
  final Place place;
  const CardItem({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConfig = Get.find();
    return ClipRRect(
      //
      borderRadius: BorderRadius.circular(18),

      // Blur Style
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),

        // Card Style
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: sizeConfig.defaultSize! * 1.6,
          ),
          // The Size Of Card
          width: sizeConfig.defaultSize! * 22.5,
          height: sizeConfig.defaultSize! * 12,
          decoration: BoxDecoration(
            color: kBlurColor,
            borderRadius: BorderRadius.circular(
              18,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                place.placeName!,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              const Gap(8),
              Row(
                children: [
                  SvgPicture.asset(
                    kLocationIcon,
                    // ignore: deprecated_member_use
                    color: kOffWhite,
                  ),
                  const Gap(5),
                  Expanded(
                    child: Text(
                      maxLines: 2,
                      place.address!,
                      style: const TextStyle(
                        color: kOffWhite,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
