import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:spot_it/auth/presentation/manager/signout_controller.dart';

//import 'package:spot_it/core/utils/size_config.dart';
import 'package:spot_it/core/widgets/signout_button.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // ~~~~ Initial Size Configuration Instance
    // SizeConfig sizeConfig = Get.put(SizeConfig());

    // Sign out controller

    // ignore: unused_local_variable
    var signoutController = Get.lazyPut(() => SignoutController());

    return Drawer(
      elevation: 0,
      shadowColor: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // First column
          // ~~~ Log out Button
          GetBuilder<SignoutController>(
            builder: (controller) => SignOutButton(
              onTap: controller.signOut,
              text: 'Sign Out',
              ionicons: Ionicons.log_out_outline,
            ),
          )
        ],
      ),
    );
  }
}
