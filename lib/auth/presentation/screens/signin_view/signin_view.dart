import 'package:flutter/material.dart';
import 'package:spot_it/core/constants/constants.dart';

import 'components/signin_body.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        scrolledUnderElevation: 0,
        elevation: 0,
      ),
      extendBodyBehindAppBar: false,
      body: const SigninBody(),
    );
  }
}
