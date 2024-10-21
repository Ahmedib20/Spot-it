import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:spot_it/core/utils/size_config.dart';

import 'package:spot_it/view/view_all_page/components/places_grid_view.dart';

class ViewAllPageBody extends StatelessWidget {
  const ViewAllPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    //
    SizeConfig sizeConfig = Get.put(SizeConfig());

    return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: sizeConfig.defaultSize! * .5,
          vertical: sizeConfig.defaultSize! * 1.6,
        ),
        child: const PlacesGridView());
  }
}
