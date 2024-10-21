import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:spot_it/core/constants/constants.dart';

class CustomDrawerButton extends StatelessWidget {
  final void Function()? onPressed;
  const CustomDrawerButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      // ~~~~ horizontal Padding
      padding: const EdgeInsets.symmetric(horizontal: 6),
      // ~~~~
      child: IconButton(
        highlightColor: Colors.transparent,
        // ~~~ ONpressed function
        onPressed: onPressed,
        icon: Container(
          width: 50,
          height: 50,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: kFieldTextColor,
            borderRadius: BorderRadius.circular(13),
          ),
          alignment: Alignment.center,
          child: SvgPicture.asset(
            kMenuIcon,
            width: 40,
          ),
        ),
      ),
    );
  }
}
