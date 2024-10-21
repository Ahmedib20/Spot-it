import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:spot_it/core/constants/constants.dart';

class PlaceInfoSection extends StatelessWidget {
  final String placeName;
  final String address;
  final double rating;
  const PlaceInfoSection({
    super.key,
    required this.placeName,
    required this.address,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Place Name
        Text(
          placeName,
          style: const TextStyle(
            fontSize: 14,
            fontFamily: 'Roboto-Bold',
          ),
          maxLines: 1,
        ),

        // Place Address section
        const Gap(3),
        Row(
          children: [
            SvgPicture.asset(
              kGreyLocations,
            ),
            const Gap(3),
            Expanded(
              child: Text(
                address,
                maxLines: 2,
                style: const TextStyle(
                  color: k6thColor,
                  fontSize: 13,
                ),
                overflow: TextOverflow
                    .ellipsis, // Shows ellipsis if overflow happens,
                softWrap: true,
              ),
            ),
          ],
        ),
        // Place Rating
        const Gap(3),
        Row(
          children: [
            SvgPicture.asset(kRatingDark),
            const Gap(5),
            Text(
              rating.toString(),
              style: const TextStyle(
                color: k6thColor,
              ),
            ),
          ],
        )
      ],
    );
  }
}
