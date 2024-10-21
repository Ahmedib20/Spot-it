import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:spot_it/controllers/get_places_controller.dart';
import 'package:spot_it/controllers/like_button_controller.dart';
import 'package:spot_it/core/constants/constants.dart';
import 'package:spot_it/model/hotels.dart';
import 'package:spot_it/model/landmarks.dart';
import 'package:spot_it/model/place.dart';
import 'package:spot_it/model/resturaunt.dart';

class WishlistController extends GetxController {
  //
  List<String> categories = ['Landmarks', 'Hotels', 'Restaurants'];
  //
  RxInt currentIndex = 0.obs;
  // initial the selected category list of type of place
  // with dummy list of categories
  RxList<Place> selectedCategoryList = <Place>[
    Resturaunt(
        placeName: 'placeName',
        address: 'address',
        description: 'description',
        imageUrl: kres1,
        latitude: 0.0,
        longitude: 0.0,
        rating: 0.0),
    Hotels(
        placeName: 'placeName',
        address: 'address',
        description: 'description',
        imageUrl: kHotel1,
        latitude: 0.0,
        longitude: 0.0,
        rating: 0.0),
    LandMarks(
        placeName: 'placeName',
        address: 'address',
        description: 'description',
        imageUrl: kplace1,
        latitude: 0.0,
        longitude: 0.0,
        rating: 0.0),
  ].obs;

  // is loading indicator
  RxBool isLoading = true.obs;

  // is the user's wishlist empty?
  RxBool isWishlistEmpty = false.obs;

  // lists of places that would be fetched from
  // the user's wishlist that stored in firebase
  List<LandMarks> landMarksList = [];
  List<Resturaunt> restaurantsList = [];
  List<Hotels> hotelsList = [];

  // initial firebase auth to get
  // the current user later
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // inital firebase firestore to fetch
  // the user's wish list
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Get the like button controller
  // to use the retrieveFromSharedPrefs method
  // to get the local saved data
  // and to useupadteSavedData if there's an update
  final LikeButtonController _likeController = Get.put(LikeButtonController());

  //
  @override
  void onInit() async {
    super.onInit();

    await fetchUserWishesList();
    setSelectedCategotyList('Landmarks');
  }

  Future<void> fetchUserWishesList() async {
    try {
      // First get the current user
      User? currentUser = _firebaseAuth.currentUser;

      // get the user's document
      // to fetch the user's wish list
      // to use it as a document id
      // to get the places data from
      // liked Places Collection
      DocumentSnapshot userDocumentSnapshot =
          await _firestore.collection('users').doc(currentUser?.uid).get();

      // then fetch place names from user's doc
      // specifically from wishlist field
      // that will be used as a document id
      List<dynamic> docIds = await userDocumentSnapshot.get('wishList');

      if (docIds.isNotEmpty) {
        // if there's a places stored in the user's wishlist
        // then we need to fetch the places details
        QuerySnapshot query = await _firestore
            .collection('likedPlaces')
            .where(FieldPath.documentId, whereIn: docIds)
            .get();
        // then convert the query to a list of maps
        List<Map<String, dynamic>> fetchedPlaces = query.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();

        // then separate each category
        List<Map<String, dynamic>> landmarks = fetchedPlaces
            .where((element) => element['category'] == 'Landmarks')
            .toList();
        List<Map<String, dynamic>> restaurants = fetchedPlaces
            .where((element) => element['category'] == 'Restaurants')
            .toList();
        List<Map<String, dynamic>> hotels = fetchedPlaces
            .where((element) => element['category'] == 'Hotels')
            .toList();

        // then set places objects
        // firstly will go with landmarks
        landMarksList =
            landmarks.map((element) => LandMarks.fromJson(element)).toList();

        restaurantsList =
            restaurants.map((element) => Resturaunt.fromJson(element)).toList();

        hotelsList = hotels.map((element) => Hotels.fromJson(element)).toList();

        // then set the current index
        // to 0 , i know why never mind
        currentIndex.value = 0;

        // after fetching all data
        // pop the loading indicator
        isLoading = false.obs;
      } else {
        // then if there is no data
        // in the user's wish list
        // then set the isWishlistEmpty to true
        isWishlistEmpty = true.obs;
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  void setSelectedCategotyList(String category) {
    switch (category) {
      case 'Landmarks':
        selectedCategoryList.value = landMarksList;
        break;
      case 'Restaurants':
        selectedCategoryList.value = restaurantsList;
        break;
      case 'Hotels':
        selectedCategoryList.value = hotelsList;
        break;
    }

    update();
  }

  // ======== remove from wishlist =======

  Future<void> removePlaceFromWishlist(Place place) async {
    try {
      // retrieve th saved places list
      List<Place> savedPlacesList =
          _likeController.retriveDataFromPrefs(place.category!);

      // then get the place's index
      // from the saved place list
      // and check if it is exist
      // with saved places
      // to toggle the like
      // button in other screens
      int index = savedPlacesList
          .indexWhere((element) => element.placeName == place.placeName);

      if (index != -1) {
        Place savedPlace = savedPlacesList[index];

        savedPlace.isLiked = !savedPlace.isLiked!;

        debugPrint('============Founded ======');
        debugPrint(savedPlace.isLiked.toString());
        // then update the saved place list
        // in shared preferences
        _likeController.updatePlacesLocally(
            place.category!, savedPlacesList); //
      }

      // then toggle the like attribute
      // of the target place

      place.isLiked = !place.isLiked!;

      update();
      // get the user to pass
      // it to remove from firebase method
      User? user = _firebaseAuth.currentUser;

      if (!place.isLiked!) {
        await _likeController.removeFromFirebase(user, place);

        removeFromLocalList(place);
        update();
      }

      // if everything is okay
      // and the target place was successfully removed
      // then delete the places controller
      // to show the updates

      bool deleted = await Get.delete<GetPlacesController>();
      debugPrint(deleted.toString());
    } catch (e) {
      place.isLiked = !place.isLiked!;

      // if there an error show the snackbar
      Get.snackbar('Error', e.toString());
      update();
    }
  }

  // remove from local lists
  void removeFromLocalList(Place place) {
    // firstly remove from selected category list
    // then check the category of target place
    // to decide from witch of other lists
    // should remove this place

    selectedCategoryList.remove(place);
    switch (place.category) {
      case 'Landmarks':
        landMarksList.remove(place);
        break;
      case 'Restaurants':
        restaurantsList.remove(place);
        break;
      case 'Hotels':
        hotelsList.remove(place);
        break;
    }
  }

  // =========
  // Error handling Dialog
  //====

  showCustomErrorDialog(String error) {
    Get.defaultDialog(
      title: 'Error',
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error,
            color: Colors.red.shade400,
          ),
          kGap15,
          Text(error),
        ],
      ),
      onConfirm: fetchUserWishesList,
    );
  }
}
