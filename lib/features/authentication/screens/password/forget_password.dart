import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sport_shop/features/authentication/screens/password/reset_password.dart';
import 'package:sport_shop/utils/constants/sizes.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
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
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email', prefixIcon: Icon(Iconsax.direct_right),
              ),
            ),
            const SizedBox(height: MySizes.spaceBtwSections,),

            ///Submit Button
            SizedBox(width: double.infinity,child: ElevatedButton(onPressed: () => Get.to(()=> const ResetPassword()), child: const Text('Submit')))
          ],
        ),
      ),
    );
  }
}
