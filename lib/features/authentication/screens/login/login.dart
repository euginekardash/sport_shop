import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sport_shop/common/styles/spacing_styles.dart';
import 'package:sport_shop/features/authentication/controllers.onboarding/login/login_controller.dart';
import 'package:sport_shop/features/authentication/screens/login/widgets/social_buttons.dart';
import 'package:sport_shop/features/authentication/screens/password/forget_password.dart';
import 'package:sport_shop/features/authentication/screens/signup/signup.dart';
import 'package:sport_shop/navigation_menu.dart';
import 'package:sport_shop/utils/constants/colors.dart';
import 'package:sport_shop/utils/constants/image_strings.dart';
import 'package:sport_shop/utils/constants/sizes.dart';
import 'package:sport_shop/utils/helpers/helper_functions.dart';
import 'package:sport_shop/utils/validators/validation.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    final controller = Get.put(LoginController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: MySpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              ///logo, title and subTitle
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    height: 150,
                    image: AssetImage(dark ? MyImages.darkAppLogo : MyImages.lightAppLogo),
                  ),
                  const SizedBox(height: MySizes.sm,),
                  Text("Добро пожаловать!", style: Theme.of(context).textTheme.headlineMedium,),
                  const SizedBox(height: MySizes.sm,),
                  Text("Откройте для себя безграничный выбор и непревзойденное удобство.", style: Theme.of(context).textTheme.bodyMedium,),
                ],
              ),
              
              ///Form

              Form(key: controller.loginFormKey, child: Padding(
                padding: const EdgeInsets.symmetric(vertical: MySizes.spaceBtwSections),
                child: Column(
                  children: [
                    ///Email
                    TextFormField(
                      controller: controller.email,
                      validator: (value) => MyValidator.validateEmail(value),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.direct_right),
                        labelText: "E-Mail",
                      ),
                    ),
                    const SizedBox(height: MySizes.spaceBtwInputFields,),

                    /// Password
                    ///Password
                    Obx(() => TextFormField(
                        validator: (value) => MyValidator.validatePassword(value),
                        controller: controller.password,
                        obscureText: controller.hidePassword.value,
                        decoration: InputDecoration(
                          labelText: "Пароль",
                          prefixIcon: const Icon(Iconsax.password_check),
                          suffixIcon: IconButton(
                            onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                            icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: MySizes.spaceBtwInputFields / 2,),

                    ///Remember me and Forget password
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ///Remember me
                        Row(
                          children: [
                                Obx(() => Checkbox(
                                    value: controller.rememberMe.value,
                                    onChanged: (value) => controller.rememberMe
                                        .value = !controller.rememberMe.value)),
                                const Text("Запомнить меня"),
                          ],
                        ),

                        ///Forget password
                        TextButton(onPressed: ()=> Get.to(()=> const ForgetPassword()), child: const Text("Забыли пароль?"))
                      ],
                    ),
                    const SizedBox(height: MySizes.spaceBtwSections,),

                    ///Sign in button
                    SizedBox(width: double.infinity ,child: ElevatedButton(onPressed: () => controller.emailAndPasswordSignIn(), child: const Text("Войти"))),
                    const SizedBox(height: MySizes.spaceBtwItems,),

                    ///Create account button
                    SizedBox(width: double.infinity ,child: OutlinedButton(onPressed: () => Get.to(() => const SignupScreen()), child: const Text("Создать аккаунт"))),

                  ],
                ),
              )),

              ///Divider
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(child: Divider(color: dark ? MyColors.darkGrey: MyColors.grey, thickness: 0.5, indent: 60, endIndent: 5,)),
                  Text("или ВОЙТИ с", style: Theme.of(context).textTheme.labelMedium,),
                  Flexible(child: Divider(color: dark ? MyColors.darkGrey: MyColors.grey, thickness: 0.5, indent: 5, endIndent: 60,)),
                ],
              ),
              const SizedBox(height: MySizes.spaceBtwSections,),

              ///Footer
              const SocialButtons(),
            ],
          )
        ),
      )
    );
  }
}


