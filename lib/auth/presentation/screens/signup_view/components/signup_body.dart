import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:spot_it/auth/presentation/manager/signup_controller.dart';
import 'package:spot_it/auth/presentation/screens/components/end_of_page_text.dart';

import 'package:spot_it/auth/presentation/screens/components/header_text.dart';
import 'package:spot_it/auth/presentation/screens/components/sign_button.dart';
import 'package:spot_it/auth/presentation/screens/components/sub_text.dart';
import 'package:spot_it/auth/presentation/screens/signup_view/components/form_fiels.dart';
import 'package:spot_it/core/constants/constants.dart';
import 'package:spot_it/core/utils/size_config.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    // SignupController signupController = Get.put(SignupController());
    SizeConfig sizeConfig = Get.put(SizeConfig());
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(
          // get the horizontal padding from size config
          horizontal: sizeConfig.horizontalPadding(),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Sign In Header
            const HeaderText(
              text: 'Sign Up',
            ),
            // Space Btw sign in and the sub text
            Gap(sizeConfig.defaultSize! * 1.5),
            //~~~sub text
            const SubText(
              text: "Let's create an account \n for you.",
            ),
            //~~~~ Space btw sub text and fieldtext
            Gap(sizeConfig.defaultSize! * .5),

            // Set Profile Picture
            Center(
              child: GetBuilder<SignupController>(
                init: SignupController(),
                builder: (controller) {
                  return CupertinoButton(
                    onPressed: controller.pickImage,
                    child: CircleAvatar(
                      radius: sizeConfig.defaultSize! * 5,
                      backgroundImage: controller.profilePicture != null
                          ? FileImage(controller.profilePicture!)
                          : const AssetImage(
                              kInitialProfilePic,
                            ),
                    ),
                  );
                },
              ),
            ),

            Gap(sizeConfig.defaultSize! * 1.5),

            //~~~~~~~~~~~~
            //~~ Form Fields
            //~~~~~~~~~~~~~~

            const FormFields(),

            //~~~~~~~~~~~~~~

            Gap(sizeConfig.defaultSize! * 3),
            //~~~~` Sign Up button
            Center(
              child: GetBuilder<SignupController>(
                builder: (controller) {
                  return SignButton(
                    text: 'Sign Up',
                    isEnabled: controller.buttonEnabled,
                    onPressed: controller.createNewUser,
                  );
                },
              ),
            ),
            Gap(sizeConfig.defaultSize! * 5),
            //~~~~ Don't have account? route to sign up screen
            EndText(
              firstText: 'Already have an account? ',
              buttonText: 'Sign In',
              onPress: () {
                Get.offAllNamed('/signin');
              },
            )
          ],
        ),
      ),
    );
  }
}
