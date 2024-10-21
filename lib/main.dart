import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:spot_it/core/utils/getpages_list.dart';
import 'package:spot_it/core/utils/settings_services.dart';

void main() async {
  //~~~~~initialize Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyDZO2J0aifybXuh3AsdsyesKnFFX9b_3hg",
    appId: "1:965027141893:android:5c1c37733bd9abcef4bf6c",
    messagingSenderId: "965027141893",
    projectId: "spot-it-ec146",
    storageBucket: "spot-it-ec146.appspot.com",
  ));
  //~~~~
  await initialServices();
  runApp(const MyApp());
}

Future initialServices() async {
  //~~~~~ initialize Shared Prefs
  await Get.putAsync(
    () => SettingsServices().init(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: getPagesList,
      theme: ThemeData(
        fontFamily: 'Roboto-Medium',
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
      ),
      initialRoute: '/',
    );
  }
}
