import 'package:flutter/cupertino.dart';

import 'package:spot_it/core/constants/constants.dart';

class ForgotPasswordButton extends StatelessWidget {
  final void Function()? onPressed;
  const ForgotPasswordButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: CupertinoButton(
        onPressed: onPressed,
        child: const Text(
          'Forgot password ?',
          style: TextStyle(
            color: k3rdColor,
            fontFamily: 'Roboto-Medium',
          ),
          textScaler: TextScaler.linear(1),
        ),
      ),
    );
  }
}
