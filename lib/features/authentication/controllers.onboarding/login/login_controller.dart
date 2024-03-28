import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sport_shop/data/repositories/authentication_repository.dart';
import 'package:sport_shop/utils/helpers/network_manager.dart';
import 'package:sport_shop/utils/popups/full_screen_loader.dart';
import 'package:sport_shop/utils/popups/loaders.dart';

class LoginController extends GetxController{

  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();


  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL');
    password.text = localStorage.read('REMEMBER_ME_PASSWORD');
    super.onInit();
  }

  Future<void> emailAndPasswordSignIn() async {
    try {
      MyFullScreenLoader.openLoadingDialog('Logging you in...', 'assets/images/animations/loading.json');

      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        MyFullScreenLoader.stopLoading();
        return;
      }

      if(!loginFormKey.currentState!.validate()) {
        MyFullScreenLoader.stopLoading();
        return;
      }

      if(rememberMe.value){
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      final userCredentials = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      MyFullScreenLoader.stopLoading();
      AuthenticationRepository.instance.screenRedirect();
    } catch(e) {
      MyFullScreenLoader.stopLoading();
      MyLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}