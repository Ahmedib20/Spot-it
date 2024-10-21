import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:spot_it/auth/presentation/manager/signout_controller.dart';
import 'package:spot_it/controllers/settings_view_controller.dart';
import 'package:spot_it/core/constants/constants.dart';
import 'package:spot_it/core/utils/size_config.dart';

import 'package:spot_it/core/widgets/headings_text.dart';
import 'package:spot_it/core/widgets/screen_heading.dart';
import 'package:spot_it/core/widgets/settings_item.dart';
import 'package:spot_it/core/widgets/settings_switch.dart';
import 'package:spot_it/core/widgets/signout_button.dart';
import 'package:spot_it/view/settings_view.dart/components/account_card.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    // initial size config controller
    //
    SizeConfig sizeConfig = Get.put(SizeConfig());
    //
    SignoutController signoutController = Get.put(SignoutController());
    //
    SettingsViewController settingsViewController =
        Get.put(SettingsViewController());
    //
    return SingleChildScrollView(
        // to let the screen be scrolable
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: sizeConfig.defaultSize! * 3,
        ),
        //
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(sizeConfig.defaultSize! * 1.2),
            // screen heading
            const ScreenHeading(text: 'Settings'),

            // space
            Gap(sizeConfig.defaultSize! * 4),

            const HeadingsText(text: 'Account'),

            // space
            Gap(sizeConfig.defaultSize! * 2),

            // account card
            GetBuilder<SettingsViewController>(
              builder: (controller) => AccountCard(
                userName: settingsViewController.user!.displayName!,
                eamil: settingsViewController.user!.email!,
                forwardTap: () {
                  // Passing the user to
                  // account edit page
                  Get.toNamed(
                    '/accountEdit',
                    arguments: {
                      'user': settingsViewController.user!,
                    },
                  );

                  // the delete the settings view controller
                  Get.delete<SettingsViewController>();
                },
                imageWidget: settingsViewController.user!.photoURL!.isNotEmpty
                    ? NetworkImage(
                        settingsViewController.user!.photoURL!,
                      )
                    : const AssetImage(kInitialProfilePic),
              ),
            ),
            // Settings section

            Gap(sizeConfig.defaultSize! * 3.5),

            const HeadingsText(text: 'Settings'),

            Gap(sizeConfig.defaultSize! * 2),

            // Language item
            SettingItem(
              title: "Language",
              icon: Ionicons.earth,
              bgColor: Colors.orange.shade100,
              iconColor: Colors.orange,
              value: "English",
              onTap: () {},
            ),
            //
            Gap(sizeConfig.defaultSize! * 3),

            SettingSwitch(
              title: "Dark Mode",
              icon: Ionicons.moon,
              bgColor: Colors.purple.shade100,
              iconColor: Colors.purple,
              value: false,
              onTap: (value) {},
            ),

            Gap(sizeConfig.defaultSize! * 3),

            SettingItem(
              title: "Help",
              icon: Ionicons.nuclear,
              bgColor: Colors.red.shade100,
              iconColor: Colors.red,
              onTap: () {},
            ),

            Gap(sizeConfig.defaultSize! * 3),

            SettingItem(
              title: "About us",
              icon: Ionicons.information_circle,
              bgColor: Colors.blue.shade100,
              iconColor: Colors.blue,
              onTap: () {},
            ),

            // Sign out button

            Gap(sizeConfig.defaultSize! * 2),

            Center(
              child: SignOutButton(
                  onTap: signoutController.signOut,
                  text: 'Sign out',
                  ionicons: Ionicons.log_out_outline),
            )
          ],
        ));
  }
}
