import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import 'package:location/location.dart' as services;
import 'package:spot_it/core/constants/constants.dart';

import 'package:spot_it/core/constants/dummy_list.dart';
import 'package:spot_it/core/utils/settings_services.dart';
import 'package:spot_it/model/hotels.dart';
import 'package:spot_it/model/landmarks.dart';
import 'package:spot_it/model/place.dart';
import 'package:spot_it/model/resturaunt.dart';

class GetPlacesController extends GetxController {
  // ~~~~~~~~~~~~~~~ initial all needed variables and instances
  final RxBool hasPermission = true.obs;
  final RxBool isServicesEnabled = true.obs;
  // ~~~~
  final Rx<LocationPermission?> permission = Rx<LocationPermission?>(null);
  // ~~ place marks list to get the location name using geocoding
  final RxList<Placemark> placeMarks = RxList<Placemark>();
  //~~~~ Current Location will be stored in this instance
  final Rx<Position?> currentLocation = Rx<Position?>(null);

  // ~~~~ place name with dummy text to show the loading indicator
  final RxString placeName = 'Dummy name'.obs;
  // ~~ Places Lists
  final RxList<Resturaunt> resturaunt = RxList<Resturaunt>();
  final List<LandMarks> landMarksList = [];
  final List<Resturaunt> resturauntsList = [];
  final List<Hotels> hotelsList = [];

  // ~~~~ Selected Category with dummy data
  // to show the loading indicator
  final RxList<Place> selectedCategory = [
    Resturaunt(
      placeName: 'placeName',
      address: 'address',
      description: 'description',
      imageUrl: kres2,
      latitude: 1111.1111,
      longitude: 1111.111,
      rating: 111.111,
    ),
    LandMarks(
      placeName: 'placeName',
      address: 'address',
      description: 'description',
      imageUrl: kres1,
      latitude: 1111.1111,
      longitude: 1111.111,
      rating: 111.111,
    ),
    Hotels(
      placeName: 'placeName',
      address: 'address',
      description: 'description',
      imageUrl: kres1,
      latitude: 1111.1111,
      longitude: 1111.111,
      rating: 111.111,
    )
  ].obs;

  // ~~~ High Rating List
  final RxList<Place>? highRatingList = highRatesDummyList.obs;

  // to deal with shared prefs instance
  final SettingsServices _settingsServices = Get.find();

  // is Loading bool var that will be used in
  // skeletonizer widget in homescreen
  RxBool isLoading = true.obs;

  @override
  void onInit() async {
    super.onInit();
    await initRequestPermission();
    await checkPermission();
  }

  Future<void> initRequestPermission() async {
    permission.value = await Geolocator.checkPermission();
    if (permission.value == LocationPermission.denied) {
      permission.value = await Geolocator.requestPermission();
    }
    hasPermission.value = permission.value == LocationPermission.whileInUse ||
        permission.value == LocationPermission.always;
  }

  Future<void> checkPermission() async {
    if (hasPermission.value) {
      await checkServicesEnabled();
    }
  }

  Future<void> checkServicesEnabled() async {
    isServicesEnabled.value = await Geolocator.isLocationServiceEnabled();
    if (!isServicesEnabled.value) {
      isServicesEnabled.value = await services.Location().requestService();
    }
    if (isServicesEnabled.value) {
      await setCurrentLocation();
      await setPlaceName();
      await fecthPlaces();
      setSelectedViewCategory('Landmarks');
      isLoading.value = !isLoading.value;
    }
    update();
  }

  Future<void> setCurrentLocation() async {
    currentLocation.value = await Geolocator.getCurrentPosition();
    update();
  }

  Future<void> setPlaceName() async {
    var getLocationData = currentLocation.value;

    try {
      placeMarks.value = await placemarkFromCoordinates(
          getLocationData!.latitude, getLocationData.longitude);
      placeName.value = '${placeMarks[0].locality}, ${placeMarks[0].country} ';

      update();
    } catch (e) {
      placeName.value = 'Somthing went wrong';
      debugPrint(' =================== ${e.toString()}');
    }
  }

  Future<void> requestPermission() async {
    permission.value = await Geolocator.requestPermission();
    hasPermission.value = permission.value == LocationPermission.whileInUse ||
        permission.value == LocationPermission.always;
    await checkPermission();
    update();
  }

  Future<void> fecthPlaces() async {
    try {
      // check is the current location far from the last location

      bool isFarFromLastLocation = await isFarFromLastLoaction();
      if (isFarFromLastLocation) {
        // then fetch the data from Api
        // because this is a new location
        var perDummyList =
            dummyList; // consider this is the data fetched from Api

        setFetchedPlaces(perDummyList);

        // after fetch the places from the API should save
        // the data locally

        // currently because of using local data
        //first should encode the map of data to json string
        String jsonString = jsonEncode(perDummyList);

        // then save the data locally
        await _settingsServices.prefs.setString('savedPlaces', jsonString);
        debugPrint(
            '============Fetched places from API After checked the distance============');
      } else {
        // if the location not far from the last location
        // or first time open the app
        String? encodedData = _settingsServices.prefs.getString('savedPlaces');
        if (encodedData != null) {
          // if there are saved places, then
          // fetch data from local storage

          // Decode the data to map of dynamic
          Map<String, dynamic> data = jsonDecode(encodedData);

          // convert the map of sring, dynamic to a map<String,List<Map<String,dynamic>>>
          Map<String, List<Map<String, dynamic>>> convertedMap = data.map(
            (key, value) => MapEntry(
              key,
              List<Map<String, dynamic>>.from(
                value.map(
                  (item) => Map<String, dynamic>.from(
                    item,
                  ),
                ),
              ),
            ),
          );

          // then set the data
          setFetchedPlaces(convertedMap);

          debugPrint('============Fetched places from Local Stora============');
        } else {
          // if there's no data stored locally, then
          // fetch the data from API

          var perDummyList =
              dummyList; // consider this is the data fetched from Api

          setFetchedPlaces(perDummyList);

          // after fetch the places from the API should save
          // the data locally

          // currently because of using local data
          //first should encode the map of data to json string
          String jsonString = jsonEncode(perDummyList);

          // then save the data locally
          await _settingsServices.prefs.setString('savedPlaces', jsonString);
          debugPrint(
              '============Fetched places from API After checked the distance============');
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  //======== SET FETCHEDE PLACES

  void setFetchedPlaces(Map<String, List<Map<String, dynamic>>> mapOfData) {
    final List<Map<String, dynamic>> landMarks = mapOfData['Landmarks'] ?? [];
    final List<Map<String, dynamic>> resturaunts =
        mapOfData['Restaurants'] ?? [];
    final List<Map<String, dynamic>> hotels = mapOfData['Hotels'] ?? [];

    // add fetched Landmarks to landMarks list
    for (var element in landMarks) {
      LandMarks landMark = LandMarks.fromJson(element);
      landMarksList.add(landMark);
    }
    // add fetched resturaunts to resturaunts list
    for (var element in resturaunts) {
      Resturaunt rest = Resturaunt.fromJson(element);
      resturauntsList.add(rest);
    }
    // add fetched hotels to hotels list
    for (var element in hotels) {
      Hotels hotel = Hotels.fromJson(element);
      hotelsList.add(hotel);
    }
  }

  // ~~~~ calculate the distance between the current and the last saved location
  Future<bool> isFarFromLastLoaction() async {
    // set the current location
    var permCurrentLocation = currentLocation.value;
    // get the last location
    var previousLocation = await Geolocator.getLastKnownPosition(
      forceAndroidLocationManager: true,
    );
    // calculate the distance btw two locations
    if (previousLocation != null) {
      double distance = Geolocator.distanceBetween(
        permCurrentLocation!.latitude,
        permCurrentLocation.longitude,
        previousLocation.latitude,
        previousLocation.longitude,
      );

      double initialDistanceInKm = 3000.0;
      if (distance > initialDistanceInKm) {
        return true;
      }
    }
    return false;
  }

  // Set the category that user
  // chased to view
  void setSelectedViewCategory(String category) {
    switch (category) {
      case 'Landmarks':
        selectedCategory.value = landMarksList;
        setHighRatingList(selectedCategory);
        update();
        break;
      case 'Resturaunts':
        selectedCategory.value = resturauntsList;
        setHighRatingList(selectedCategory);
        update();
        break;
      case 'Hotels':
        selectedCategory.value = hotelsList;
        setHighRatingList(selectedCategory);
        break;
    }
  }

  // ================= set high rating list =================

  void setHighRatingList(RxList<Place> placesList) {
    try {
      double maxRating = _findMaxRating(placesList);

      List<Place> maxRatingPlaces = placesList
          .where(
            (place) =>
                place.rating == maxRating || place.rating == maxRating - 1,
          )
          .toList();
      highRatingList?.value = maxRatingPlaces;
      update();
    } catch (e) {
      debugPrint('++++++++++ Hight Rating List Exception ${e.toString()}');
    }
  }

  double _findMaxRating(List<Place> placesList) {
    double maxRating = 0.0;
    for (Place place in placesList) {
      if (place.rating! > maxRating) {
        maxRating = place.rating!;
      }
    }
    return maxRating;
  }
}
