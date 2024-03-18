import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:sport_shop/common/widgets/success_screen/success_screen.dart';
import 'package:sport_shop/data/repositories/authentication_repository.dart';
import 'package:sport_shop/utils/popups/loaders.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  sendEmailVerification() async {
    try{
      await AuthenticationRepository.instance.sendEmailVerification();
      MyLoaders.successSnackBar(title: 'Email sent', message: 'Please, check your inbox and verify your email.');
    }catch(e){
      MyLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  setTimerForAutoRedirect(){
    Timer.periodic(const Duration(seconds: 1), (timer) async {
       await FirebaseAuth.instance.currentUser?.reload();
       final user = FirebaseAuth.instance.currentUser;
       if(user?.emailVerified ?? false){
         timer.cancel();
         Get.off(() =>
             SuccessScreen(
                 image: 'assets/images/animations/72462-check-register.json',
                 title: 'Your account is created!',
                 subTitle: 'Thank you! Now your account is successfully created.',
                 onPressed: () =>
                     AuthenticationRepository.instance.screenRedirect()
             ),
         );
       }
    }
    );
  }

  checkEmailVerificationStatus() async{
    final currentUser = FirebaseAuth.instance.currentUser;
    if(currentUser != null && currentUser.emailVerified) {
      Get.off(
          () => SuccessScreen(
              image: 'assets/images/animations/72462-check-register.json',
              title: 'Your account is created!',
              subTitle: 'Thank you! Now your account is successfully created.',
              onPressed: () =>
                  AuthenticationRepository.instance.screenRedirect())
      );
    }
  }
}