import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sport_shop/features/authentication/controllers.onboarding/forget_password/forget_password_controller.dart';
import 'package:sport_shop/features/authentication/screens/password/reset_password.dart';
import 'package:sport_shop/utils/constants/sizes.dart';
import 'package:sport_shop/utils/validators/validation.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(MySizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Headings
            Text('Forget password', style: Theme.of(context).textTheme.headlineMedium,),
            const SizedBox(height: MySizes.spaceBtwItems,),
            Text('Enter your email and we will send you a password reset link', style: Theme.of(context).textTheme.labelMedium,),
            const SizedBox(height: MySizes.spaceBtwSections * 2,),

            ///Text field
            Form(
              key: controller.forgetPasswordFormKey,
              child: TextFormField(
                controller: controller.email,
                validator: MyValidator.validateEmail,
                decoration: const InputDecoration(
                  labelText: 'Email', prefixIcon: Icon(Iconsax.direct_right),
                ),
              ),
            ),
            const SizedBox(height: MySizes.spaceBtwSections,),

            ///Submit Button
            SizedBox(width: double.infinity,child: ElevatedButton(onPressed: () => controller.sendPasswordResetEmail(), child: const Text('Submit')))
          ],
        ),
      ),
    );
  }
}
