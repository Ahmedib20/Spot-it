import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:spot_it/core/constants/constants.dart';

class CurrentLocationText extends StatelessWidget {
  final String? text;
  const CurrentLocationText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          kLocationIcon,
          width: 23,
        ),
        const Gap(7),
        Text(
          text ?? 'Unavailable location',
          style: const TextStyle(
            fontFamily: 'Roboto-Medium',
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
