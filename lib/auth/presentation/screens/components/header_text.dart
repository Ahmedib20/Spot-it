import 'package:flutter/material.dart';
import 'package:spot_it/core/constants/constants.dart';

class HeaderText extends StatelessWidget {
  final String text;
  const HeaderText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: 'Roboto-Medium',
        color: k3rdColor,
      ),
      textScaler: const TextScaler.linear(2),
    );
  }
}
