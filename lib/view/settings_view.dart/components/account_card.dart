import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:spot_it/core/constants/constants.dart';
import 'package:spot_it/core/utils/size_config.dart';
import 'package:spot_it/core/widgets/buttons/forward_button.dart';

class AccountCard extends StatelessWidget {
  final void Function()? forwardTap;

  final String userName;
  final String eamil;
  final ImageProvider imageWidget;
  const AccountCard({
    super.key,
    required this.forwardTap,
    required this.userName,
    required this.eamil,
    required this.imageWidget,
  });

  @override
  Widget build(BuildContext context) {
    //
    SizeConfig sizeConfig = Get.find();
    //

    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          // Profile picture
          CircleAvatar(
            radius: sizeConfig.defaultSize! * 4,
            backgroundImage: imageWidget,
          ),

          // Space between the image and the user name
          Gap(
            sizeConfig.defaultSize! * 2.5,
          ),
          //
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'Roboto-Medium',
                ),
              ),
              Gap(sizeConfig.defaultSize!),
              Text(
                eamil,
                style: const TextStyle(
                  fontSize: 14,
                  color: k6thColor,
                ),
              )
            ],
          ),

          const Spacer(),
          // forward button
          ForwardButton(
            onTap: forwardTap,
          )
        ],
      ),
    );
  }
}
