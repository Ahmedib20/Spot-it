import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:spot_it/core/constants/constants.dart';
import 'package:spot_it/core/widgets/buttons/category_button.dart';

class ErrorContent extends StatelessWidget {
  final void Function()? onPressed;
  final String? text;
  final String? buttonText;
  const ErrorContent({
    super.key,
    required this.onPressed,
    required this.text,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //~~~~~ content text
        Text(
          text!,
          style: const TextStyle(
            color: k5thColor,
          ),
          textAlign: TextAlign.center,
        ),

        //~~~ space btw the content text and the button
        const Gap(10),

        //~~~ The Button

        CategoryButton(
          text: buttonText,
          onPressed: onPressed,
          selected: true,
        )
      ],
    );
  }
}
