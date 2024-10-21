import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:spot_it/core/constants/constants.dart';
import 'package:spot_it/core/utils/size_config.dart';

class PageViewItem extends StatelessWidget {
  final String image;
  final String title;
  final String desc;
  const PageViewItem({
    super.key,
    required this.image,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    //~~~~~~~~ init size confug
    SizeConfig controller = Get.find();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: controller.defaultSize! * 25,
          height: controller.defaultSize! * 25,
          child: SvgPicture.asset(image),
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: controller.defaultSize! * 2,
            fontFamily: 'Roboto-Bold',
          ),
        ),
        Text(
          desc,
          style: const TextStyle(
            color: k5thColor,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
