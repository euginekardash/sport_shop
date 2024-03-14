import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_shop/data/repositories/authentication_repository.dart';
import 'package:sport_shop/data/repositories/user/user_repository.dart';
import 'package:sport_shop/features/authentication/models/user_model.dart';
import 'package:sport_shop/features/authentication/screens/signup/verify_email.dart';
import 'package:sport_shop/utils/helpers/network_manager.dart';
import 'package:sport_shop/utils/popups/full_screen_loader.dart';
import 'package:sport_shop/utils/popups/loaders.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  void signup() async {
    try {
      MyFullScreenLoader.openLoadingDialog('tralala', 'assets/images/animations/loading.json');

      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {
        MyFullScreenLoader.stopLoading();
        return;
      }

      if(!signupFormKey.currentState!.validate()) {
        MyFullScreenLoader.stopLoading();
        return;
      }

      if(!privacyPolicy.value) {
        MyLoaders.warningSnackBar(
            title: 'Accept privacy policy',
            message: 'In order to create account, you must have to read and accept the Privacy Policy & Terms of Use'
        );
        return;
      }

      //register user in the firebase
      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

      //save user
      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          username: username.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      MyFullScreenLoader.stopLoading();
      
      MyLoaders.successSnackBar(title: 'Congratulations', message: 'Your account has been created! Verify email to continue.');

      Get.to(() => const VerifyEmailScreen());
    } catch(e) {
      MyFullScreenLoader.stopLoading();

      MyLoaders.errorSnackBar(title: 'oh Snap!', message: e.toString());
    }
  }
}