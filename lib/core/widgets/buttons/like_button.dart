import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spot_it/core/constants/constants.dart';

class LikeButton extends StatelessWidget {
  final bool? isLiked;
  final void Function()? onPressed;
  const LikeButton({
    super.key,
    required this.isLiked,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.black.withOpacity(0.4),
        child: SvgPicture.asset(
          isLiked! ? kLiked : kDisLiked,
          width: 30,
        ),
      ),
    );
  }
}
