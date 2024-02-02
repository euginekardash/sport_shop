import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sport_shop/features/authentication/screens/signup/verify_email.dart';
import 'package:sport_shop/features/authentication/screens/signup/widgets/terms_conditions_checkbox.dart';
import 'package:sport_shop/utils/constants/sizes.dart';

class MySignupForm extends StatelessWidget {
  const MySignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(child: Column(
      children: [
        ///first & last name
        Row(
          children: [
            Expanded(
              child: TextFormField(
                expands: false,
                decoration: const InputDecoration(
                  labelText: "First Name",
                  prefixIcon: Icon(Iconsax.user),
                ),
              ),
            ),
            const SizedBox(width: MySizes.spaceBtwInputFields,),
            Expanded(
              child: TextFormField(
                expands: false,
                decoration: const InputDecoration(
                  labelText: "Last Name",
                  prefixIcon: Icon(Iconsax.user),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: MySizes.spaceBtwInputFields,),

        ///Username
        TextFormField(
          expands: false,
          decoration: const InputDecoration(
            labelText: "Username",
            prefixIcon: Icon(Iconsax.user_edit),
          ),
        ),
        ///Email
        TextFormField(
          expands: false,
          decoration: const InputDecoration(
            labelText: "E-mail",
            prefixIcon: Icon(Iconsax.direct),
          ),
        ),
        const SizedBox(height: MySizes.spaceBtwInputFields,),
        ///Phone Number
        TextFormField(
          expands: false,
          decoration: const InputDecoration(
            labelText: "Phone number",
            prefixIcon: Icon(Iconsax.call),
          ),
        ),
        const SizedBox(height: MySizes.spaceBtwInputFields,),
        ///Password
        TextFormField(
          obscureText: true,
          decoration: const InputDecoration(
            labelText: "Password",
            prefixIcon: Icon(Iconsax.password_check),
            suffixIcon: Icon(Iconsax.eye_slash),
          ),
        ),
        const SizedBox(height: MySizes.spaceBtwInputFields,),
        ///Terms&Conditions Checkbox
        const MyTermsAndConditionCheckBox(),
        const SizedBox(height: MySizes.spaceBtwSections,),

        ///Sign Up button
        SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.to(() =>const VerifyEmailScreen()), child: const Text("Create Account"),),)
      ],
    ),
    );
  }
}
