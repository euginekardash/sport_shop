import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sport_shop/common/styles/spacing_styles.dart';
import 'package:sport_shop/features/authentication/screens/login/login.dart';
import 'package:sport_shop/utils/constants/image_strings.dart';
import 'package:sport_shop/utils/constants/sizes.dart';
import 'package:sport_shop/utils/helpers/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.image, required this.title, required this.subTitle, required this.onPressed});

  final String image, title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: MySpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              ///Image
              Image(image:AssetImage(image), width: MyHelperFunctions.screenWigth() * 0.6,),
              const SizedBox(height:  MySizes.spaceBtwSections,),

              ///Title & SubTitle
              Text(title, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
              const SizedBox(height:  MySizes.spaceBtwItems,),
              Text(subTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,),
              const SizedBox(height:  MySizes.spaceBtwSections,),

              ///Button
              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: onPressed, child: const Text('Continue'),),),
            ],
          ),
        ),
      )
    );
  }
}
