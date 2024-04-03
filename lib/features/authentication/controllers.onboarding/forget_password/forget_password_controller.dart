import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sport_shop/data/repositories/authentication_repository.dart';
import 'package:sport_shop/features/authentication/screens/password/reset_password.dart';
import 'package:sport_shop/utils/helpers/network_manager.dart';
import 'package:sport_shop/utils/popups/full_screen_loader.dart';
import 'package:sport_shop/utils/popups/loaders.dart';

class ForgetPasswordController extends GetxController{
  static ForgetPasswordController get instance => Get.find();

  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  sendPasswordResetEmail() async{
    try{
      MyFullScreenLoader.openLoadingDialog('Processing your request...', 'assets/images/animations/loading.json');

      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {
        MyFullScreenLoader.stopLoading();
        return;
      }

      if(!forgetPasswordFormKey.currentState!.validate()){
        MyFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      MyFullScreenLoader.stopLoading();
      
      MyLoaders.successSnackBar(title: 'Email Sent', message: 'Email link sent to reset your password'.tr);
      
      Get.to(() => ResetPassword(email: email.text.trim(),));

    }catch(e){
      MyFullScreenLoader.stopLoading();
      MyLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async{
    try{
      MyFullScreenLoader.openLoadingDialog('Processing your request...', 'assets/images/animations/loading.json');

      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {
        MyFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      MyFullScreenLoader.stopLoading();

      MyLoaders.successSnackBar(title: 'Email Sent', message: 'Email link sent to reset your password'.tr);

    }catch(e){
      MyFullScreenLoader.stopLoading();
      MyLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
    }
  }
}