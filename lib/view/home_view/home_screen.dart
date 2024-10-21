import 'package:flutter/material.dart';

import 'package:spot_it/core/constants/constants.dart';

import 'package:spot_it/core/widgets/buttons/custom_drawer_button.dart';
import 'package:spot_it/core/widgets/custom_drawer/custom_drawer.dart';
import 'package:spot_it/view/home_view/components/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ~~~~ initial Scaffold Key
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,

      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: kAppBarColor,
        leading: CustomDrawerButton(
          onPressed: () {
            scaffoldKey.currentState!.openDrawer();
          },
        ),
        leadingWidth: 80,
      ),
      // ~~~~ Drawer
      drawer: const CustomDrawer(),
      // Scaffold Body
      body: const HomeScreenBody(),
    );
  }
}
