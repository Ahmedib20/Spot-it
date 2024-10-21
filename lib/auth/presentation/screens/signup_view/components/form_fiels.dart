import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:spot_it/auth/presentation/manager/signup_controller.dart';
import 'package:spot_it/auth/presentation/screens/components/custom_textfield.dart';
import 'package:spot_it/core/constants/constants.dart';
import 'package:spot_it/core/utils/size_config.dart';

class FormFields extends StatelessWidget {
  const FormFields({super.key});

  @override
  Widget build(BuildContext context) {
    //`~~~ find the sign up injected  controller
    // SignupController signupController = Get.find();
    //~~~` initialize size config
    SizeConfig sizeConfig = Get.find();
    return Column(
      children: [
        //~~~~~~~ Full Name
        GetBuilder<SignupController>(
          init: SignupController(),
          builder: (controller) {
            return CustomTextfield(
              onChanged: (str) {
                controller.validateFullName(str);
              },
              hintText: 'Full Name',
              textController: controller.fullName,
              prefixIcon: kUser,
              prefixIconColor:
                  controller.isFullNameValid ? k4thColor : k5thColor,
            );
          },
        ),
        //~~~~ Space
        Gap(sizeConfig.defaultSize! * 2),

        //~~~ EMAIL FIELD
        GetBuilder<SignupController>(
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
        GetBuilder<SignupController>(
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

        Gap(sizeConfig.defaultSize! * 2),

        //~~~~ Confirm Password
        GetBuilder<SignupController>(
          builder: (controller) {
            return CustomTextfield(
              onChanged: (str) {
                controller.confirmValidator(str);
              },
              hintText: 'Confrim Password',
              textController: controller.confirmPassword,
              prefixIcon: kPassword2,
              prefixIconColor:
                  controller.isConfirmValid ? k4thColor : k5thColor,
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
