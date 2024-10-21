import 'package:flutter/material.dart';
import 'package:spot_it/auth/presentation/screens/signup_view/components/signup_body.dart';
import 'package:spot_it/core/constants/constants.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: const SignUpBody(),
    );
  }
}
