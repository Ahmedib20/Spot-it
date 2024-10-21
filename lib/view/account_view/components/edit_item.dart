import 'package:flutter/material.dart';

import 'package:spot_it/core/constants/constants.dart';

class EditItem extends StatelessWidget {
  final int widgetExpandedFlex;
  final Widget widget;
  final String title;
  const EditItem({
    super.key,
    required this.widget,
    required this.title,
    required this.widgetExpandedFlex,
  });

  @override
  Widget build(BuildContext context) {
    //
    // SizeConfig sizeConfig = Get.find();
    //
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              color: k5thColor,
            ),
          ),
        ),
        // Gap(sizeConfig.defaultSize! * 1),
        Expanded(
          flex: widgetExpandedFlex,
          child: widget,
        )
      ],
    );
  }
}
