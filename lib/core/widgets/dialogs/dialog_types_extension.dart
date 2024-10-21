import 'package:flutter/material.dart';

enum DialogType {
  warning,
  error,
  success,
}

extension DialogTypeExtension on DialogType {
  IconData get icon {
    switch (this) {
      case DialogType.warning:
        return Icons.warning_amber_rounded;
      case DialogType.error:
        return Icons.error_outline_rounded;
      case DialogType.success:
        return Icons.check_circle_outline_outlined;
    }
  }

  Color get color {
    switch (this) {
      case DialogType.warning:
        return Colors.yellow.shade700;
      case DialogType.error:
        return Colors.red.shade300;
      case DialogType.success:
        return Colors.green.shade300;
    }
  }

  String get title {
    switch (this) {
      case DialogType.warning:
        return 'Warning';
      case DialogType.error:
        return 'Error';
      case DialogType.success:
        return 'Success';
    }
  }
}
