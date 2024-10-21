import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spot_it/core/utils/settings_services.dart';
import 'package:spot_it/model/hotels.dart';

import 'package:spot_it/model/landmarks.dart';
import 'package:spot_it/model/place.dart';
import 'package:spot_it/model/resturaunt.dart';

class LikeButtonController extends GetxController {
  // GET the Setting Services Instance to deal with the shared preferences
  final SettingsServices _settingsController = Get.find();
  // whilist list
  final RxList<Map<String, dynamic>> wishList = RxList<Map<String, dynamic>>();

  // Get instance of firebase firestore
  // to add the liked place data to
  // users document & places document
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Get instnce of firebase auth to get the user
  // information to add the liked place
  // to the user's wishlist
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // =============
  // retrive data from the shared preferences

  List<Place> retriveDataFromPrefs(String category) {
    // retrieve data from preferences
    String? jsonString = _settingsController.prefs.getString('savedPlaces');

    // decode the json string to map
    Map<String, dynamic> parsedJson = jsonDecode(jsonString!);

    // cast it to map<String,List<Map<String,dynamic>>>
    return List<Place>.from(
      parsedJson[category].map(
        (place) {
          switch (category) {
            case 'Landmarks':
              return LandMarks.fromJson(place);
            case 'Restaurants':
              return Resturaunt.fromJson(place);
            case 'Hotels':
              return Hotels.fromJson(place);
          }
        },
      ),
    );
  }

  Future<void> toggleLikeAndSync(Place place) async {
    try {
      // retrieve the current data
      List<Place> places = retriveDataFromPrefs(place.category!);

      // find the index of the place by matching the placename
      int index =
          places.indexWhere((element) => element.placeName == place.placeName);
      if (index != -1) {
        // toggle the isLiked
        places[index].isLiked = !places[index].isLiked!;

        place.isLiked = !place.isLiked!;

        // then add/remove to/from firebase

        // get the current user to add
        // the place to his wishlist
        // according to the user's id
        User? user = _firebaseAuth.currentUser;

        if (place.isLiked! == true) {
          addToFirebase(user, place);
        } else {
          // if is unLiked then remove from firebase
          removeFromFirebase(user, place);
        }

        // save updated info in the shared preferences
        await updatePlacesLocally(place.category!, places);

        update();
      }
    } catch (e) {
      debugPrint('===================Toggle${e.toString()}');
      place.isLiked = !place.isLiked!;
      update();
    }
  }

  // update the locally saved places
  Future<void> updatePlacesLocally(String category, List<Place> places) async {
    try {
      // retrieve the saved data from the shared preferences
      String? jsonString = _settingsController.prefs.getString('savedPlaces');
      // decode the json string
      Map<String, dynamic> parsedJson =
          jsonString != null ? jsonDecode(jsonString) : {};
      parsedJson[category] = places
          .map(
            (place) => {
              'placeName': place.placeName,
              'description': place.description,
              'address': place.address,
              'latitude': place.latitude,
              'longitude': place.longitude,
              'imageUrl': place.imageUrl,
              'ratings': place.rating,
              'isLiked': place.isLiked,
            },
          )
          .toList();
      await _settingsController.prefs.setString(
        'savedPlaces',
        jsonEncode(parsedJson),
      );
    } catch (e) {
      debugPrint('===================Save${e.toString()}');
    }
  }

  // ============ add the place to fireabse
  // And user's wish list =====
  Future<void> addToFirebase(User? user, Place place) async {
    try {
      // assign a reference to the user's doc so
      // that we can update the user's wishlist

      DocumentReference? reference =
          _firestore.collection('users').doc(user?.uid);

      // Docment Reference from liked places
      // collection
      DocumentReference? placeRefreference =
          _firestore.collection('likedPlaces').doc(
                place.placeName,
              );

      // get the user's wish list and
      // check if the place is exist
      DocumentSnapshot userDocSnapshot = await reference.get();

      // then pass it wishlist checker
      bool isPlaceExist = await checkWishList(
        userDocSnapshot,
        place.placeName!,
      );

      if (isPlaceExist == false) {
        // if the place is not exist
        // then add it to the wishlist
        // Get the place doc from the fireabse
        // to check if it exists
        // and if it is not there
        // so gonna add it to the
        // places document and user's  wishlist
        DocumentSnapshot doc = await placeRefreference.get();

        if (!doc.exists) {
          // if not exists, add it to the places document
          _firestore.collection('likedPlaces').doc(place.placeName).set(
            {
              'placeName': place.placeName,
              'address': place.address,
              'description': place.description,
              'latitude': place.latitude,
              'longitude': place.longitude,
              'imageUrl': place.imageUrl,
              'category': place.category,
              'isLiked': place.isLiked,
              'ratings': place.rating,
              'likedBy': FieldValue.arrayUnion(
                [user?.uid],
              )
            },
          );

          // then add it to the user's wishList
          reference.update({
            'wishList': FieldValue.arrayUnion(
              [
                place.placeName,
              ],
            ),
          });
          debugPrint(
              '============= Added to wishList and places collection Successfully ====');
          Get.snackbar(
            'Added',
            'Added to wishList successfully',
            duration: const Duration(
              seconds: 1,
            ),
          );
        } else {
          // if the place is already in the places collection
          // then no need to add it to the places collection
          // we just need to add it to the user's wishList
          // then add it to the user's wishList

          reference.update({
            'wishList': FieldValue.arrayUnion(
              [
                place.placeName,
              ],
            ),
          });

          // and add the user to liked by
          // field of the place
          placeRefreference.update({
            'likedBy': FieldValue.arrayUnion(
              [user?.uid],
            ),
          });
          //
          debugPrint('============= Added to wishList Successfully ====');
          Get.snackbar(
            'Added',
            'Added to wishList successfully',
            duration: const Duration(seconds: 1),
          );
        }
      } else {
        // notify the users thar place
        // is already in the wishlist
        Get.snackbar(
          'Already Exist',
          'Place already in the wishlist',
          duration: const Duration(
            seconds: 1,
          ),
        );
        place.isLiked = !place.isLiked!;
        update();
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Something went wrong',
        duration: const Duration(seconds: 1),
      );
      place.isLiked = !place.isLiked!;
      update();
    }
  }

  // ==== Remove from firebase
  Future<void> removeFromFirebase(User? user, Place place) async {
    String placeToFind = place.placeName!;
    try {
      // assign a reference to the user's doc so
      // that we can update the user's wishlist

      DocumentReference? reference =
          _firestore.collection('users').doc(user?.uid);

      // then fetch the document
      // to pass it to
      //check wish list
      DocumentSnapshot docSnapshot = await reference.get();

      if (docSnapshot.exists) {
        // check the wish list
        bool isExists = await checkWishList(docSnapshot, placeToFind);

        // create a new reference from likedplaces collection
        // to delete the user from liked by
        // list of place's doc
        DocumentReference? placesRef =
            _firestore.collection('likedPlaces').doc(placeToFind);

        if (isExists) {
          await reference.update({
            'wishList': FieldValue.arrayRemove(
              // Use FieldValue to remove specific value
              [placeToFind],
            ),
          });

          await placesRef.update({
            'likedBy': FieldValue.arrayRemove(
              [user?.uid],
            ),
          });

          debugPrint('=========== removed successfully');
          Get.snackbar(
            'Removed',
            'Removed successfully from the wish list',
            duration: const Duration(seconds: 1),
          );
        }
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Something went wrong',
        duration: const Duration(seconds: 1),
      );
      place.isLiked = !place.isLiked!;
      update();
    }
  }

  // check if the place
  // is exist in wishlist
  Future<bool> checkWishList(
      DocumentSnapshot docSnapshot, String placeToFind) async {
    // get the wish list
    List<dynamic> wishList = await docSnapshot.get('wishList');

    if (wishList.contains(placeToFind)) {
      return true;
    }
    return false;
  }
}
