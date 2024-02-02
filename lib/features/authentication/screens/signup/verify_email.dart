import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sport_shop/common/widgets/success_screen/success_screen.dart';
import 'package:sport_shop/features/authentication/screens/login/login.dart';
import 'package:sport_shop/utils/constants/image_strings.dart';
import 'package:sport_shop/utils/constants/sizes.dart';
import 'package:sport_shop/utils/helpers/helper_functions.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => Get.offAll(() =>const LoginScreen()), icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MySizes.defaultSpace),
          child: Column(
            children: [
              ///Image
              Image(image:const AssetImage(MyImages.onBoardingImage1), width: MyHelperFunctions.screenWigth() * 0.6,),
              const SizedBox(height:  MySizes.spaceBtwSections,),

              ///Title & SubTitle
              Text("Verify your email address!", style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
              const SizedBox(height:  MySizes.spaceBtwItems,),
              Text('support@kardash.com', style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center,),
              const SizedBox(height:  MySizes.spaceBtwItems,),
              Text('Congratulations! Your Account Awaits: Verify your Email to start shopping and experience a world of unrivaled deals and personalized offers', style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,),
              const SizedBox(height:  MySizes.spaceBtwSections,),

              /// Buttons
              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: ()=> Get.to(()=>SuccessScreen(image: MyImages.onBoardingImage1,title: "Your account successfully created!",subTitle: 'Welcome to your ultimate shopping destination. Your account is created, unleash the joy of seamless online shopping!',onPressed: ()=> Get.to(()=>const LoginScreen()),)), child: const Text('Continue'),),),
              const SizedBox(height:  MySizes.spaceBtwItems,),
              SizedBox(width: double.infinity, child: TextButton(onPressed: (){}, child: const Text('Resend Email'),),),
            ],
          ),
        ),
      ),
    );
  }
}
