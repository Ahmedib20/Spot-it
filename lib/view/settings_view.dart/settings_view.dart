import 'package:flutter/material.dart';
import 'package:spot_it/core/widgets/buttons/custom_drawer_button.dart';
import 'package:spot_it/core/widgets/custom_drawer/custom_drawer.dart';
import 'package:spot_it/view/settings_view.dart/components/settings_view_body.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: CustomDrawerButton(onPressed: () {
          scaffoldKey.currentState!.openDrawer();
        }),
        leadingWidth: 80,
      ),
      // Custom Drawer
      drawer: const CustomDrawer(),

      body: const SettingsViewBody(),
    );
  }
}
