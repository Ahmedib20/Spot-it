import 'package:flutter/material.dart';

class EditTextFiled extends StatelessWidget {
  final Function(String)? onChanged;
  final TextEditingController controller;
  const EditTextFiled({
    super.key,
    this.onChanged,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 1,
      onChanged: onChanged,
      controller: controller,
    );
  }
}
