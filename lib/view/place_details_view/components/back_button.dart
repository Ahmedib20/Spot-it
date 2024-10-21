import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  final void Function()? onPressed;
  const CustomBackButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.black.withOpacity(0.4),
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          )),
    );
  }
}
