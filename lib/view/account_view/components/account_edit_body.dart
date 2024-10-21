import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import 'package:spot_it/controllers/account_edit_controller.dart';
import 'package:spot_it/core/constants/constants.dart';
import 'package:spot_it/core/utils/size_config.dart';
import 'package:spot_it/core/widgets/screen_heading.dart';
import 'package:spot_it/core/widgets/signout_button.dart';
import 'package:spot_it/view/account_view/components/edit_item.dart';
import 'package:spot_it/view/account_view/components/edit_text_filed.dart';

class AccountEditBody extends StatelessWidget {
  const AccountEditBody({super.key});

  @override
  Widget build(BuildContext context) {
    // initialize size config to do responsive ui
    SizeConfig sizeConfig = Get.put(SizeConfig());

    // account edit controller
    AccountEditController accountEditController = Get.find();
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(
        horizontal: sizeConfig.defaultSize! * 3,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //
          Gap(sizeConfig.defaultSize! * 3),

          // header
          const ScreenHeading(text: 'Account'),

          //
          Gap(sizeConfig.defaultSize! * 6),

          // Profile picture section
          EditItem(
            widget: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GetBuilder<AccountEditController>(
                  builder: (controller) => CircleAvatar(
                    // if the user picked an image
                    // then show the image that was picked
                    // otherwise show the user's profile pic

                    backgroundImage: accountEditController.pickedImage != null
                        ? FileImage(accountEditController.pickedImage!)
                        // else if
                        : accountEditController.imageUrl.isNotEmpty
                            //then
                            ? NetworkImage(accountEditController.imageUrl)
                            // else
                            : const AssetImage(kInitialProfilePic),
                    //
                    radius: sizeConfig.defaultSize! * 5,
                  ),
                ),
                // sapce between profile picture and edit button
                Gap(sizeConfig.defaultSize!),

                // Edit Photo
                TextButton(
                  onPressed: accountEditController.pickImage,
                  child: const Text('Edit Photo'),
                ),
              ],
            ),
            //
            widgetExpandedFlex: 3,
            title: 'Photo',
          ),

          //
          Gap(sizeConfig.defaultSize! * 3),

          EditItem(
            title: 'Name',
            widget: EditTextFiled(
              controller: accountEditController.fullName,
              onChanged: (value) {
                accountEditController.textFieldnChanged(
                    accountEditController.fullName, value);
              },
            ),
            widgetExpandedFlex: 6,
          ),
          Gap(sizeConfig.defaultSize! * 5),
          EditItem(
            title: 'Email',
            widget: EditTextFiled(
              controller: accountEditController.email,
              onChanged: (value) {
                accountEditController.textFieldnChanged(
                    accountEditController.email, value);
              },
            ),
            widgetExpandedFlex: 6,
          ),

          //
          Gap(sizeConfig.defaultSize! * 10),

          // used signout button for delete account
          Center(
            child: SignOutButton(
              text: 'Delete Account',
              onTap: accountEditController.showConfirmationDialog,
            ),
          ),
        ],
      ),
    );
  }
}
