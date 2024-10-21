//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SettingsViewController extends GetxController {
  User? user;
//
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  //
  //final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void onInit() async {
    super.onInit();
    await getUserAccount();
  }

  Future<void> getUserAccount() async {
    try {
      user = _firebaseAuth.currentUser;

      update();
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
