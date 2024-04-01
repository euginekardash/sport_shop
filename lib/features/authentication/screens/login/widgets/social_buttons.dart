import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_shop/features/authentication/controllers.onboarding/login/login_controller.dart';
import 'package:sport_shop/utils/constants/colors.dart';
import 'package:sport_shop/utils/constants/image_strings.dart';
import 'package:sport_shop/utils/constants/sizes.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(border: Border.all(color: MyColors.grey), borderRadius: BorderRadius.circular(50)),
          child: IconButton(
            onPressed: () => controller.googleSignIn(),
            icon: const Image(
              width: MySizes.iconMd,
              height: MySizes.iconMd,
              image: AssetImage(MyImages.google),
            ),
          ),
        ),
        /*const SizedBox(width: MySizes.spaceBtwItems,),
        Container(
          decoration: BoxDecoration(border: Border.all(color: MyColors.grey), borderRadius: BorderRadius.circular(50)),
          child: IconButton(
            onPressed: (){},
            icon: const Image(
              width: MySizes.iconMd,
              height: MySizes.iconMd,
              image: AssetImage(MyImages.facebook),
            ),
          ),
        ),*/
      ],
    );
  }
}