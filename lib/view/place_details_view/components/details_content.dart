import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:spot_it/controllers/details_view_controller.dart';
import 'package:spot_it/core/constants/constants.dart';
import 'package:spot_it/core/utils/size_config.dart';
import 'package:spot_it/core/widgets/headings_text.dart';
import 'package:spot_it/model/place.dart';
import 'package:spot_it/view/place_details_view/components/details_card.dart';

class DetailsContent extends StatelessWidget {
  final Place place;
  const DetailsContent({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    //~~~~~~~~Intialize the Size Config object
    SizeConfig sizeConfig = Get.put(SizeConfig());

    DetailsViewController detailsViewController = Get.find();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Place Card
        DetailsCard(
          place: place,
        ),
        // OverView Section
        // OverView and rating row
        Gap(sizeConfig.defaultSize! * 3.5),

        Row(
          children: [
            const HeadingsText(
              text: 'Overview',
            ),

            // Overview
            // Space between header and Rating
            Gap(sizeConfig.defaultSize! * 20),
            //
            Row(
              children: [
                SvgPicture.asset(kRatingDark),
                const Gap(4),
                Text(
                  place.rating.toString(),
                  style: const TextStyle(
                    color: k5thColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),

        Gap(sizeConfig.defaultSize! * 1.6),

        Align(
          alignment: Alignment.topLeft,
          child: Text(
            '${detailsViewController.distance} away from you',
            style: const TextStyle(
              color: k5thColor,
            ),
          ),
        ),

        // Place Description Section
        Gap(sizeConfig.defaultSize! * 3),
        Text(
          place.description!,
          maxLines: 2,
          style: TextStyle(
            color: k5thColor,
            fontSize: sizeConfig.defaultSize! * 2,
          ),
          overflow:
              TextOverflow.ellipsis, // Shows ellipsis if overflow happens,
          softWrap: true,
        ),
      ],
    );
  }
}
