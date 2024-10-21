import 'package:flutter/material.dart';
import 'package:spot_it/core/constants/constants.dart';

class EndText extends StatelessWidget {
  final String firstText;
  final String buttonText;
  final void Function()? onPress;
  const EndText({
    super.key,
    required this.firstText,
    required this.buttonText,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          firstText,
          style: const TextStyle(
            color: k5thColor,
          ),
        ),
        TextButton(
          onPressed: onPress,
          child: Text(
            buttonText,
            style: const TextStyle(
              color: kSecColor,
            ),
          ),
        )
      ],
    );
  }
}
