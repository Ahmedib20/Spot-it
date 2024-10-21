import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:spot_it/core/constants/constants.dart';
import 'package:spot_it/core/utils/size_config.dart';

class ShowOnMapButton extends StatelessWidget {
  final void Function()? onPressed;
  const ShowOnMapButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConfig = Get.find();
    return MaterialButton(
        onPressed: onPressed,
        //~~button shape
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        //~~Button color
        color: kSecColor,
        //~~~ text color
        textColor: kOffWhite,
        //~~button size
        minWidth: sizeConfig.defaultSize! * 34,
        padding: EdgeInsets.all(sizeConfig.defaultSize! * 1.8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              kLocationIcon,
              color: kOffWhite,
            ),
            kGap8,
            Text(
              'Show on map',
              style: TextStyle(
                fontFamily: 'Roboto-Medium',
                fontSize: sizeConfig.defaultSize! * 1.8,
              ),
            ),
          ],
        ));
  }
}
