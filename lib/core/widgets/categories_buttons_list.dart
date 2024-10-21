import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:spot_it/controllers/get_places_controller.dart';
import 'package:spot_it/controllers/home_controller.dart';
import 'package:spot_it/core/utils/size_config.dart';
import 'package:spot_it/core/widgets/buttons/category_button.dart';

class CategoriesButtonsList extends StatelessWidget {
  const CategoriesButtonsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // ~~~~~ initial Size config
    SizeConfig sizeConfig = Get.find();
    // ~~~~ initial places controller
    GetPlacesController placesController = Get.find();
    //~~~~~ home controller
    HomeController homeController = Get.put(HomeController());

    return SizedBox(
      height: sizeConfig.defaultSize! * 6,
      child: ListView.separated(
        //
        scrollDirection: Axis.horizontal,
        //
        physics: const BouncingScrollPhysics(),
        //

        itemBuilder: (context, index) => Obx(
          // Category Button
          () => CategoryButton(
            text: homeController.categories[index],
            onPressed: () {
              placesController.setSelectedViewCategory(
                homeController.categories[index],
              );
              homeController.currentIndex.value = index;
            },
            selected: homeController.currentIndex.value == index,
          ),
        ),
        separatorBuilder: (context, i) => SizedBox(
          width: sizeConfig.defaultSize! * 2,
        ),
        itemCount: homeController.categories.length,
      ),
    );
  }
}
