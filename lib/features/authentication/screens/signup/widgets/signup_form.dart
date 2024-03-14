import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sport_shop/features/authentication/controllers.onboarding/signup/signup_controller.dart';
import 'package:sport_shop/features/authentication/screens/signup/verify_email.dart';
import 'package:sport_shop/features/authentication/screens/signup/widgets/terms_conditions_checkbox.dart';
import 'package:sport_shop/utils/constants/sizes.dart';
import 'package:sport_shop/utils/validators/validation.dart';

class MySignupForm extends StatelessWidget {
  const MySignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
      children: [
        ///first & last name
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: controller.firstName,
                validator: (value) => MyValidator.validateEmptyText('First name', value),
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
                controller: controller.lastName,
                validator: (value) => MyValidator.validateEmptyText('Last name', value),
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
          validator: (value) => MyValidator.validateEmptyText('Username', value),
          controller: controller.username,
          expands: false,
          decoration: const InputDecoration(
            labelText: "Username",
            prefixIcon: Icon(Iconsax.user_edit),
          ),
        ),
        ///Email
        TextFormField(
          validator: (value) => MyValidator.validateEmail(value),
          controller: controller.email,
          expands: false,
          decoration: const InputDecoration(
            labelText: "E-mail",
            prefixIcon: Icon(Iconsax.direct),
          ),
        ),
        const SizedBox(height: MySizes.spaceBtwInputFields,),
        ///Phone Number
        TextFormField(
          validator: (value) => MyValidator.phoneNumber(value),
          controller: controller.phoneNumber,
          expands: false,
          decoration: const InputDecoration(
            labelText: "Phone number",
            prefixIcon: Icon(Iconsax.call),
          ),
        ),
        const SizedBox(height: MySizes.spaceBtwInputFields,),
        ///Password
        Obx(
          () => TextFormField(
            validator: (value) => MyValidator.validatePassword(value),
            controller: controller.password,
            obscureText: controller.hidePassword.value,
            decoration: InputDecoration(
              labelText: "Password",
              prefixIcon: const Icon(Iconsax.password_check),
              suffixIcon: IconButton(
                  onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                  icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
              ),
            ),
          ),
        ),
        const SizedBox(height: MySizes.spaceBtwInputFields,),
        ///Terms&Conditions Checkbox
        const MyTermsAndConditionCheckBox(),
        const SizedBox(height: MySizes.spaceBtwSections,),

        ///Sign Up button
        SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => controller.signup(), child: const Text("Create Account"),),)
      ],
    ),
    );
  }
}
