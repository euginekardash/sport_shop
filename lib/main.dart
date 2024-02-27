import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_shop/app.dart';
import 'package:sport_shop/firebase_options.dart';

Future<void> main() async {

  //Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,).then(
          (FirebaseApp value) => Get.put(AuthenticationRepository())
  );

  runApp(const App());
}


