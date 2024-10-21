import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:spot_it/controllers/wishlist_controller.dart';
import 'package:spot_it/core/utils/size_config.dart';
import 'package:spot_it/core/widgets/buttons/category_button.dart';

class WishCategoriesButtons extends StatelessWidget {
  const WishCategoriesButtons({super.key});

  @override
  Widget build(BuildContext context) {
    WishlistController wishlistController = Get.find();
    SizeConfig sizeConfig = Get.find();

    return SizedBox(
      height: sizeConfig.defaultSize! * 8,
      //
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        //
        physics: const BouncingScrollPhysics(),

        padding: EdgeInsets.symmetric(
            horizontal: sizeConfig.defaultSize! * .5,
            vertical: sizeConfig.defaultSize!),
        itemBuilder: (context, index) => Obx(
          // Category Button
          () => CategoryButton(
            text: wishlistController.categories[index],
            onPressed: () {
              wishlistController.setSelectedCategotyList(
                wishlistController.categories[index],
              );
              wishlistController.currentIndex.value = index;
            },
            selected: wishlistController.currentIndex.value == index,
          ),
        ),
        separatorBuilder: (context, i) => SizedBox(
          width: sizeConfig.defaultSize! * 2,
        ),
        itemCount: wishlistController.categories.length,
      ),
    );
  }
}
