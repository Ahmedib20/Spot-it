import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spot_it/controllers/wishlist_controller.dart';
import 'package:spot_it/core/constants/constants.dart';
import 'package:spot_it/view/home_view/home_screen.dart';
import 'package:spot_it/view/map_view/map_view.dart';
import 'package:spot_it/view/settings_view.dart/settings_view.dart';
import 'package:spot_it/view/wishlist_view/wishlist_view.dart';

class BottomNaviagtionController extends GetxController {
  List<Widget> screens = [
    const HomeScreen(),
    const GoogleMapView(),
    const WishlistView(),
    const SettingsView(),
  ];

  List<String> navigationDestinationIcons = [
    kHomeIcon,
    kMapIcon,
    kWishIcon,
    kSettingsIcon
  ];

  List<String> destinationToolTips = ['Home', 'Map', 'Wishlist', 'Settings'];

  RxInt slectedIndex = 0.obs;

  destinationSelected(int index) {
    slectedIndex.value = index;
    // when navigate to any page
    // but not the wishlist view
    // then delete the wishlist controller
    if (slectedIndex.value != 2) {
      Get.delete<WishlistController>();
    }
  }
}
