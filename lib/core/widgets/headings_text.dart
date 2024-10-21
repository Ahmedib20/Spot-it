import 'package:flutter/material.dart';
import 'package:spot_it/core/constants/constants.dart';

class HeadingsText extends StatelessWidget {
  final String text;
  const HeadingsText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: 'Roboto-Bold',
        fontSize: 19,
        color: k3rdColor,
      ),
    );
  }
}
