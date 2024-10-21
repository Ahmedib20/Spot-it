import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:spot_it/core/widgets/dialogs/dialog_types_extension.dart';

class DialogBody extends StatelessWidget {
  final DialogType type;
  final String message;

  const DialogBody({super.key, required this.type, required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          type.icon,
          color: type.color,
          size: 40,
        ),
        const Gap(5),
        Text(
          message,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
