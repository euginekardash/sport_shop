import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_shop/features/authentication/controllers.onboarding/forget_password/forget_password_controller.dart';
import 'package:sport_shop/features/authentication/screens/login/login.dart';
import 'package:sport_shop/utils/constants/image_strings.dart';
import 'package:sport_shop/utils/constants/sizes.dart';
import 'package:sport_shop/utils/helpers/helper_functions.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed:()=> Get.offAll(() =>const LoginScreen()), icon: const Icon(CupertinoIcons.clear)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MySizes.defaultSpace),
          child: Column(
            children: [
              ///Image
              Image(image:const AssetImage(MyImages.onBoardingImage2), width: MyHelperFunctions.screenWigth() * 0.6,),
              const SizedBox(height:  MySizes.spaceBtwSections,),

              ///Title & SubTitle
              Text(email, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center,),
              const SizedBox(height:  MySizes.spaceBtwItems,),
              Text('Password reset Email sent', style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
              const SizedBox(height:  MySizes.spaceBtwItems,),
              Text('Your account security is our priority! We\'ve send you a secure link to safely change your password and keep your account protected', style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,),
              const SizedBox(height:  MySizes.spaceBtwSections,),

              ///Button
              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.offAll(() => const LoginScreen()), child: const Text('Continue'),),),
              const SizedBox(height:  MySizes.spaceBtwSections,),
              SizedBox(width: double.infinity, child: TextButton(onPressed: () => ForgetPasswordController.instance.resendPasswordResetEmail(email), child: const Text('Resend Email'),),),

            ],
          ),
        ),
      ),
    );
  }
}
