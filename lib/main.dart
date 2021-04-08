import 'package:app/Controller/database_controller.dart';
import 'package:app/Controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app/Routes/app_routes.dart';
import 'package:app/Routes/app_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:app/Controller/auth_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(DataBaseController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final controllerLocation = Get.put(ProfileController());
  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( 
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.splash_screen,
      getPages: AppScreen.screen,
    );
  }
}
