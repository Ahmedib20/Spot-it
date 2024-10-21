import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:spot_it/auth/presentation/manager/reset_password_controller.dart';
import 'package:spot_it/auth/presentation/screens/components/custom_textfield.dart';
import 'package:spot_it/auth/presentation/screens/components/sign_button.dart';
import 'package:spot_it/core/constants/constants.dart';

import 'package:spot_it/core/utils/size_config.dart';

class ResetPasswordBody extends StatelessWidget {
  const ResetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    // find the injected size config cintroller
    SizeConfig sizeConfig = Get.find();
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: sizeConfig.horizontalPadding(),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Gap(sizeConfig.defaultSize! * 3),
          // ~~~~~ decription text
          const Text(
            "Please enter your email and we will send you "
            "a link to reset your password.",
            style: TextStyle(
              color: k5thColor,
            ),
            textScaler: TextScaler.linear(1.2),
          ),

          //~~~~ Space btw text & email field
          Gap(sizeConfig.defaultSize! * 3),

          GetBuilder<ResetPasswordController>(
            init: ResetPasswordController(),
            builder: (controller) => CustomTextfield(
              textController: controller.email,
              hintText: 'Email',
              prefixIcon: kEmail2,
              onChanged: (text) {
                controller.validateEmail(text);
              },
              prefixIconColor: controller.isEmailValid ? k4thColor : k5thColor,
            ),
          ),
          //~~~~~~~~~~`
          Gap(sizeConfig.defaultSize! * 2),

          //~~~~~~~~~~~ Send link button
          GetBuilder<ResetPasswordController>(
            builder: (controller) => SignButton(
              isEnabled: controller.isEmailValid,
              onPressed: controller.sendResetPasswordLink,
              text: 'Send The Link',
            ),
          )
        ],
      ),
    );
  }
}
