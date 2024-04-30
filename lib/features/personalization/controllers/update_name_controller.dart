import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_shop/data/repositories/user/user_repository.dart';
import 'package:sport_shop/features/personalization/controllers/user_controller.dart';
import 'package:sport_shop/features/personalization/screens/profile/profile.dart';
import 'package:sport_shop/utils/helpers/network_manager.dart';
import 'package:sport_shop/utils/popups/full_screen_loader.dart';
import 'package:sport_shop/utils/popups/loaders.dart';

class UpdateNameController extends GetxController{
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  Future<void> initializeNames() async{
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async{
    try{
      MyFullScreenLoader.openLoadingDialog('Изменяем вашу информацию...', 'assets/images/animations/loading.json');

      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {
        MyFullScreenLoader.stopLoading();
        return;
      }

      if(!updateUserNameFormKey.currentState!.validate()){
        MyFullScreenLoader.stopLoading();
        return;
      }

      Map<String, dynamic> name = {'FirstName': firstName.text.trim(), 'LastName': lastName.text.trim()};
      await userRepository.updateSingleField(name);

      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      MyFullScreenLoader.stopLoading();

      MyLoaders.successSnackBar(title: 'Поздравляем', message: 'Ваше имя изменено');

      Get.off(() => const ProfileScreen());
    }catch(e){
      MyLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
    }
  }
 }