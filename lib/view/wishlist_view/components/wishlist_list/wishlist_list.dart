import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:spot_it/controllers/wishlist_controller.dart';
import 'package:spot_it/core/utils/size_config.dart';
import 'package:spot_it/model/place.dart';
import 'package:spot_it/view/wishlist_view/components/wishlist_list/wishlist_card.dart';

class WishlistList extends StatelessWidget {
  const WishlistList({super.key});

  @override
  Widget build(BuildContext context) {
    // initialize size config
    SizeConfig sizeConfig = Get.find();

    WishlistController wishlistController = Get.find();
    // let the list expand the rest of the s creen
    return Obx(
      () => Expanded(
        // Loading indicator
        child: Skeletonizer(
          //
          enabled: wishlistController.isLoading.value,

          // List view
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: sizeConfig.defaultSize!,
              vertical: sizeConfig.defaultSize!,
            ),
            // Wishlist cards
            itemBuilder: (context, index) {
              Place place = wishlistController.selectedCategoryList[index];

              //
              return WishlistCard(
                place: place,
                onTap: () {
                  // when the user clicks on the wishlist card
                  // route to the detail view
                  Get.toNamed(
                    '/detailsView',
                    arguments: {'place': place},
                  );

                  // and delete the wishlist controller
                  // from memory
                  Get.delete<WishlistController>();
                },
              );
            },
            // separtor widget
            separatorBuilder: (context, index) => SizedBox(
              height: sizeConfig.defaultSize! * 2.4,
            ),

            // lengyj of wish list
            itemCount: wishlistController.selectedCategoryList.length,
          ),
        ),
      ),
    );
  }
}
