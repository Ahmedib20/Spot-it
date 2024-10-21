import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:spot_it/core/utils/settings_services.dart';
import 'package:spot_it/core/widgets/dialogs/show_dialog.dart';

class SignoutController extends GetxController {
  // instance of the settings services to
  // access to shared preferences
  SettingsServices settingsServices = Get.find();

  // Firebase Auth Instance
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //~~~~ Sign out
  Future<void> signOut() async {
    // show loading dialog
    showLoadingDialog();

    await _firebaseAuth.signOut();

    //pop loading dialog
    Get.back();
    settingsServices.prefs.remove('savedPlaces');
    Get.offNamed('/signin');
  }
}
