import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spot_it/controllers/account_edit_controller.dart';
import 'package:spot_it/core/constants/constants.dart';
import 'package:spot_it/core/widgets/buttons/arrow_back_button.dart';
import 'package:spot_it/view/account_view/components/account_edit_body.dart';
import 'package:spot_it/view/account_view/components/update_confirm_button.dart';

class AccountEditView extends StatelessWidget {
  const AccountEditView({super.key});

  @override
  Widget build(BuildContext context) {
    AccountEditController accountEditController =
        Get.put(AccountEditController());
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: kAppBarColor,
        scrolledUnderElevation: 0,
        elevation: 0,
        leading: ArrowBackButton(
          onTap: () {
            Get.back();
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: GetBuilder<AccountEditController>(
              //
              builder: (controller) => UpdateConfirmButton(
                onPressed: controller.updateUserProfile,
                isEnabled: accountEditController.updateButtonEnabled,
              ),
            ),
          ),
        ],
      ),
      body: const AccountEditBody(),
    );
  }
}
