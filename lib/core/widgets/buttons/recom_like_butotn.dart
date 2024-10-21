import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spot_it/core/constants/constants.dart';

class RecomLikeButotn extends StatelessWidget {
  final bool? isLiked;
  final void Function()? onPressed;
  const RecomLikeButotn({
    super.key,
    required this.isLiked,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SvgPicture.asset(
        isLiked! ? kLiked : kFavoriteDark,
        width: 30,
      ),
    );
  }
}
