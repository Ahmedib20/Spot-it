import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:get/get.dart';

import 'package:spot_it/controllers/wishlist_controller.dart';
import 'package:spot_it/core/utils/size_config.dart';

import 'package:spot_it/core/widgets/headings_text.dart';
import 'package:spot_it/view/wishlist_view/components/wish_categories_buttons.dart';
import 'package:spot_it/view/wishlist_view/components/wishlist_list/wishlist_list.dart';

class WishlistBody extends StatelessWidget {
  const WishlistBody({super.key});

  @override
  Widget build(BuildContext context) {
    // initialize size config
    SizeConfig sizeConfig = Get.put(SizeConfig());
    // initialize wishlist controller
    WishlistController wishlistController = Get.put(WishlistController());
    //
    return Padding(
      // Set the page padding
      padding: EdgeInsets.symmetric(
        horizontal: sizeConfig.defaultSize! * 3,
      ),

      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(sizeConfig.defaultSize! * 3),
          // Wishlist heading text
          const HeadingsText(text: 'Your wishlist'),

          Gap(sizeConfig.defaultSize! * 1.8),

          // categories
          const WishCategoriesButtons(),
          // wishlist list
          Gap(sizeConfig.defaultSize! * 2.5),

          // first will check if the ilst is empty
          // if it is empty then notify the user
          // there is no data to display
          // otherwise display the data
          Obx(() {
            if (wishlistController.isWishlistEmpty.value == true ||
                wishlistController.selectedCategoryList.isEmpty) {
              return const Expanded(
                child: Center(
                  child: Text(
                    'This category is empty',
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 17,
                    ),
                  ),
                ),
              );
            }
            return const WishlistList();
          }),
        ],
      ),
    );
  }
}
