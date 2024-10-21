import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:spot_it/auth/presentation/manager/signin_controller.dart';
import 'package:spot_it/auth/presentation/screens/components/custom_textfield.dart';
import 'package:spot_it/core/constants/constants.dart';
import 'package:spot_it/core/utils/size_config.dart';

class EmailAndPassword extends StatelessWidget {
  const EmailAndPassword({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConfig = Get.find();
    return Column(
      children: [
        GetBuilder<SignInController>(
          init: SignInController(),
          builder: (controller) {
            return CustomTextfield(
              onChanged: (str) {
                controller.validateEmail(str);
              },
              isEmail: true,
              hintText: 'Email',
              textController: controller.email,
              prefixIcon: kEmail2,
              prefixIconColor: controller.isEmailValid ? k4thColor : k5thColor,
            );
          },
        ),

        //~~~~ Space
        Gap(sizeConfig.defaultSize! * 2),
        //~~~~ Password Field
        GetBuilder<SignInController>(
          builder: (controller) {
            return CustomTextfield(
              onChanged: (str) {
                controller.validatePassowrd(str);
              },
              hintText: 'Password',
              textController: controller.password,
              prefixIcon: kPassword2,
              prefixIconColor:
                  controller.isPasswordValid ? k4thColor : k5thColor,
              isPassword: true,
              suffixIcon: controller.isObsecure ? kEyeClosed : keye,
              isObsecured: controller.isObsecure,
              isObsecuredButton: controller.isObsecuredText,
            );
          },
        ),
      ],
    );
  }
}
