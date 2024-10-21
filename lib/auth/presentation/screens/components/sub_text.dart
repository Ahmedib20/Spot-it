import 'package:flutter/material.dart';
import 'package:spot_it/core/constants/constants.dart';

class SubText extends StatelessWidget {
  final String text;
  const SubText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: 'Roboto-Medium',
        color: k5thColor,
      ),
      textScaler: const TextScaler.linear(1),
    );
  }
}
