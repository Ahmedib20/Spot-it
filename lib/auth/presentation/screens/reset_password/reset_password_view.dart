import 'package:flutter/material.dart';
import 'package:spot_it/auth/presentation/screens/reset_password/components/reset_password_body.dart';
import 'package:spot_it/core/constants/constants.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Reset Password'),
        backgroundColor: kSecColor,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontFamily: 'Roboto-Medium',
          fontSize: 20,
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: const ResetPasswordBody(),
    );
  }
}
