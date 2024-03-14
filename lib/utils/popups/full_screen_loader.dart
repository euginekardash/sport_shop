import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_shop/common/widgets/loaders/animation_loader.dart';
import 'package:sport_shop/utils/constants/colors.dart';
import 'package:sport_shop/utils/helpers/helper_functions.dart';

class MyFullScreenLoader {
  static void openLoadingDialog(String text, String animation){
    showDialog(
        context: Get.overlayContext!,
        builder: (_) => PopScope(
          canPop: false,
            child: Container(
              color: MyHelperFunctions.isDarkMode(Get.context!) ? MyColors.dark : MyColors.white,
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  const SizedBox(height: 250,),
                  MyAnimationLoaderWidget(text: text, animation: animation)
                ],
              ),
            )
        ),
    );
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}