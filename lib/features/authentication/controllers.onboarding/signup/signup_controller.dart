import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_shop/utils/helpers/network_manager.dart';
import 'package:sport_shop/utils/popups/full_screen_loader.dart';
import 'package:sport_shop/utils/popups/loaders.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final hidePassword = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  Future<void> signup() async {
    try {
      MyFullScreenLoader.openLoadingDialog('tralala', 'assets/images/on_boarding_images/dazzle-line-girl-on-skate.gif');

      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) return;

      if(!signupFormKey.currentState!.validate()) return;


    } catch(e) {
      MyLoaders.errorSnackBar(title: 'oh Snap!', message: e.toString());
    } finally {
      MyFullScreenLoader.stopLoading();
    }
  }
}