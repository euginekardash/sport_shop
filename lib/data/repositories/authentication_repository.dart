import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sport_shop/features/authentication/screens/login/login.dart';
import 'package:sport_shop/features/authentication/screens/onboarding/onboarding.dart';
import 'package:sport_shop/features/authentication/screens/signup/verify_email.dart';
import 'package:sport_shop/navigation_menu.dart';
import 'package:sport_shop/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:sport_shop/utils/exceptions/firebase_exceptions.dart';
import 'package:sport_shop/utils/exceptions/format_exceptions.dart';
import 'package:sport_shop/utils/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  ///variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }


  screenRedirect() async {
    final user = _auth.currentUser;
    if(user != null){
      if(user.emailVerified){
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email,));
      }
    } else{
      //local storage
      if(kDebugMode) {
        print('-------------Get Storage auth------------');
        print(deviceStorage.read('IsFirstTime'));
      }

      deviceStorage.writeIfNull('IsFirstTime', true);
      deviceStorage.read('IsFirstTime') != true ?
        Get.offAll(() => const LoginScreen()) :
        Get.offAll(const OnBoardingScreen());
    }


  }


  ///LOGIN
  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
    try{
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch(e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch(_) {
      throw const TFormatException();
    } on PlatformException catch(e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }


  ///REGISTER
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try{
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch(e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch(_) {
      throw const TFormatException();
    } on PlatformException catch(e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  ///MAIL VERIFICATION
  Future<void> sendEmailVerification() async{
    try {
      await _auth.currentUser?.sendEmailVerification();
    }on FirebaseAuthException catch(e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch(e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch(_) {
      throw const TFormatException();
    } on PlatformException catch(e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  ///logout user
  Future<void> logout() async{
    try{
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    }on FirebaseAuthException catch(e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch(e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch(_) {
      throw const TFormatException();
    } on PlatformException catch(e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }
}