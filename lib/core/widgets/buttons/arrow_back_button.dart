import 'package:flutter/material.dart';

class ArrowBackButton extends StatelessWidget {
  final void Function() onTap;
  const ArrowBackButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: const Icon(
        Icons.arrow_back_ios_new_rounded,
      ),
    );
  }
}
