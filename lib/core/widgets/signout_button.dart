import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:spot_it/core/utils/size_config.dart';

class SignOutButton extends StatelessWidget {
  final void Function() onTap;
  final String text;
  final IoniconsData? ionicons;
  const SignOutButton({
    super.key,
    required this.onTap,
    required this.text,
    this.ionicons,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConfig = Get.find();

    return InkWell(
      onTap: onTap,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Container(
          alignment: Alignment.center,
          width: sizeConfig.defaultSize! * 18,
          height: sizeConfig.defaultSize! * 6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              width: 1.5,
              color: Colors.red.shade400,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //
              ionicons != null
                  ? Icon(
                      ionicons,
                      color: Colors.red.shade400,
                    )
                  : const SizedBox(),
              //

              Text(
                text,
                style: TextStyle(
                  color: Colors.red.shade400,
                  fontFamily: 'Roboto-Regular',
                ),
              ),
            ],
          )),
    );
  }
}
