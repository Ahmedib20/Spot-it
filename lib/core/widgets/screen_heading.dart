import 'package:flutter/material.dart';

class ScreenHeading extends StatelessWidget {
  final String text;
  const ScreenHeading({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 36,
        fontFamily: 'Roboto-Bold',
      ),
    );
  }
}
