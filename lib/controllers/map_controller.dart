import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:spot_it/controllers/get_places_controller.dart';
import 'package:spot_it/core/constants/constants.dart';

class MapController extends GetxController {
  GetPlacesController getPlacesController = Get.put(GetPlacesController());
  Rx<Position?> getUserCurrentLocation = Rx<Position?>(null);

  // categories list
  List<String> categoriesIcons = [
    khotelIcon,
    kResturauntIcon,
    kCafeIcon,
    kResturauntIcon
  ];
  List<String> categories = ['Hotles', 'Resturaunts', 'Cafe', 'Hospitals'];

  RxInt currentIndex = 99.obs;

  @override
  void onInit() async {
    super.onInit();
    await setUserCurrentLocation();
  }

  Future<void> setUserCurrentLocation() async {
    getUserCurrentLocation.value = getPlacesController.currentLocation.value;
  }

  void categoryButtonOnTap(int index) {
    if (currentIndex.value == index) {
      // then disabled the button
      currentIndex.value = 99;
    } else {
      currentIndex.value = index;
    }
  }
}
