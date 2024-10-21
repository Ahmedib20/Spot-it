import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:spot_it/auth/presentation/manager/signin_controller.dart';
import 'package:spot_it/auth/presentation/screens/components/end_of_page_text.dart';
import 'package:spot_it/auth/presentation/screens/components/header_text.dart';
import 'package:spot_it/auth/presentation/screens/components/sign_button.dart';
import 'package:spot_it/auth/presentation/screens/components/sub_text.dart';
import 'package:spot_it/auth/presentation/screens/signin_view/components/email_and_password.dart';
import 'package:spot_it/auth/presentation/screens/signin_view/components/forgot_password_button.dart';
import 'package:spot_it/auth/presentation/screens/signin_view/components/google_signin_button.dart';
import 'package:spot_it/core/constants/constants.dart';
import 'package:spot_it/core/utils/size_config.dart';

class SigninBody extends StatelessWidget {
  const SigninBody({super.key});

  @override
  Widget build(BuildContext context) {
    SignInController signInController = Get.put(SignInController());

    SizeConfig sizeConfig = Get.put(SizeConfig());

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(
          // get the horizontal padding from size config
          horizontal: sizeConfig.horizontalPadding(),
        ),
        // ~~~ Sign in Body
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Sign In Header
            const HeaderText(
              text: 'Sign In',
            ),
            // Space Btw sign in and the sub text
            Gap(sizeConfig.defaultSize! * 1.5),

            //~~~sub text
            const SubText(
              text: "Stay informed effortlessly. Sign in and \n"
                  "find out what’s around you",
            ),
            //~~~~ Space btw sub text and fieldtext
            Gap(sizeConfig.defaultSize! * 4),

            //~~~~ Email And Password
            const EmailAndPassword(),

            Gap(sizeConfig.defaultSize! * 1.5),

            //~~~Forgot password
            ForgotPasswordButton(
              onPressed: () {
                Get.toNamed(
                  '/resetpassword',
                );
              },
            ),

            Gap(sizeConfig.defaultSize! * 3),

            //~~~~` Sign in button

            Center(
              child: GetBuilder<SignInController>(
                init: SignInController(),
                builder: (controller) {
                  return SignButton(
                    text: 'Sign In',
                    isEnabled: controller.buttonEnabled,
                    onPressed: controller.signIInWithEmailPassword,
                  );
                },
              ),
            ),
            Gap(sizeConfig.defaultSize! * 7),

            //~~~~OR
            const Divider(),
            const Center(
              child: Text(
                'Or',
                style: TextStyle(color: k6thColor),
              ),
            ),
            //~~~~~~~~~
            Gap(sizeConfig.defaultSize! * 4),

            //~~~Google Sign in button
            Center(
              child: GoogleSigninButton(
                onPressed: signInController.signInWithGoogle,
              ),
            ),
            Gap(sizeConfig.defaultSize! * 5),
            //~~~~ Don't have account? route to sign up screen
            EndText(
              firstText: 'Don\'t have an account? ',
              buttonText: 'Sign Up',
              onPress: () {
                Get.offAllNamed('/signup');
              },
            )
          ],
        ),
      ),
    );
  }
}
