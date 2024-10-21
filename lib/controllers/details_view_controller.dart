import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:spot_it/controllers/get_places_controller.dart';
import 'package:spot_it/model/place.dart';

class DetailsViewController extends GetxController {
  late Place place;
  // to get current user location
  // to calculate the distance
  // between the user and the place
  final GetPlacesController _getPlacesController =
      Get.put(GetPlacesController());

  String distance = '';

  @override
  void onInit() {
    super.onInit();
    place = Get.arguments['place'];

    calculateDistance();
  }

  void calculateDistance() {
    Position? userCurrentPosition = _getPlacesController.currentLocation.value;
    double distanceInDouble = Geolocator.distanceBetween(
      userCurrentPosition!.latitude,
      userCurrentPosition.longitude,
      place.latitude!,
      place.longitude!,
    );

    if (distanceInDouble > 1000) {
      double temp = distanceInDouble / 1000;
      distance = '${temp.toInt()}Km';
    } else {
      distance = '${distanceInDouble.toInt()} Meters';
    }
  }
}
