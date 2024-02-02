import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sport_shop/common/styles/spacing_styles.dart';
import 'package:sport_shop/features/authentication/screens/password/forget_password.dart';
import 'package:sport_shop/features/authentication/screens/signup/signup.dart';
import 'package:sport_shop/navigation_menu.dart';
import 'package:sport_shop/utils/constants/colors.dart';
import 'package:sport_shop/utils/constants/image_strings.dart';
import 'package:sport_shop/utils/constants/sizes.dart';
import 'package:sport_shop/utils/helpers/helper_functions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);

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
                  Text("Welcome back!", style: Theme.of(context).textTheme.headlineMedium,),
                  const SizedBox(height: MySizes.sm,),
                  Text("Discover Limitless choices and unmatched convenience.", style: Theme.of(context).textTheme.bodyMedium,),
                ],
              ),
              
              ///Form
              Form(child: Padding(
                padding: const EdgeInsets.symmetric(vertical: MySizes.spaceBtwSections),
                child: Column(
                  children: [
                    ///Email
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.direct_right),
                        labelText: "E-Mail",
                      ),
                    ),
                    const SizedBox(height: MySizes.spaceBtwInputFields,),

                    /// Password
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.password_check),
                        labelText: "Password",
                        suffixIcon: Icon(Iconsax.eye_slash),
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
                            Checkbox(value: true, onChanged: (value){}),
                            const Text("Remember me"),
                          ],
                        ),

                        ///Forget password
                        TextButton(onPressed: ()=> Get.to(()=> const ForgetPassword()), child: const Text("Forget password?"))
                      ],
                    ),
                    const SizedBox(height: MySizes.spaceBtwSections,),

                    ///Sign in button
                    SizedBox(width: double.infinity ,child: ElevatedButton(onPressed: () => Get.to(() =>const NavigationMenu()), child: const Text("Sign in"))),
                    const SizedBox(height: MySizes.spaceBtwItems,),

                    ///Create account button
                    SizedBox(width: double.infinity ,child: OutlinedButton(onPressed: () => Get.to(() => const SignupScreen()), child: const Text("Create Account"))),

                  ],
                ),
              )),

              ///Divider
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(child: Divider(color: dark ? MyColors.darkGrey: MyColors.grey, thickness: 0.5, indent: 60, endIndent: 5,)),
                  Text("or SIGN IN with", style: Theme.of(context).textTheme.labelMedium,),
                  Flexible(child: Divider(color: dark ? MyColors.darkGrey: MyColors.grey, thickness: 0.5, indent: 5, endIndent: 60,)),
                ],
              ),
              const SizedBox(height: MySizes.spaceBtwSections,),

              ///Footer
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(border: Border.all(color: MyColors.grey), borderRadius: BorderRadius.circular(50)),
                    child: IconButton(
                      onPressed: (){},
                      icon: const Image(
                        width: MySizes.iconMd,
                        height: MySizes.iconMd,
                        image: AssetImage(MyImages.google),
                      ),
                    ),
                  ),
                  const SizedBox(width: MySizes.spaceBtwItems,),
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
                  ),
                ],
              )
            ],
          )
        ),
      )
    );
  }
}
