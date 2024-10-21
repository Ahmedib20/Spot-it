import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:spot_it/core/constants/constants.dart';
import 'package:spot_it/core/utils/size_config.dart';

class UpdateConfirmButton extends StatelessWidget {
  final void Function()? onPressed;
  final bool isEnabled;
  const UpdateConfirmButton({
    super.key,
    required this.onPressed,
    required this.isEnabled,
  });

  @override
  Widget build(BuildContext context) {
    ///
    SizeConfig sizeConfig = Get.find();
    return MaterialButton(
      elevation: 3,
      // Button size
      minWidth: sizeConfig.defaultSize! * 4,

      height: sizeConfig.defaultSize! * 5,

      // button shape
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      // Button Color
      disabledColor: k5thColor,
      color: Colors.blue,

      // on pressed function
      onPressed: isEnabled ? onPressed : null,

      // button child
      child: const Icon(
        Ionicons.checkmark_sharp,
        color: kAppBarColor,
      ),
    );
  }
}
