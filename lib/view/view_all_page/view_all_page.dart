import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spot_it/core/constants/constants.dart';

import 'package:spot_it/core/widgets/buttons/arrow_back_button.dart';
import 'package:spot_it/view/view_all_page/components/view_all_body.dart';

class ViewAllPage extends StatelessWidget {
  const ViewAllPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All'),
        backgroundColor: kAppBarColor,
        scrolledUnderElevation: 0,
        elevation: 0,
        leading: ArrowBackButton(
          onTap: () {
            Get.back();
          },
        ),
      ),
      body: const ViewAllPageBody(),
    );
  }
}
