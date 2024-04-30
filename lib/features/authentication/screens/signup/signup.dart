import 'package:flutter/material.dart';
import 'package:sport_shop/common/widgets/appbar/appbar.dart';
import 'package:sport_shop/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:sport_shop/utils/constants/colors.dart';
import 'package:sport_shop/utils/constants/image_strings.dart';
import 'package:sport_shop/utils/constants/sizes.dart';
import 'package:sport_shop/utils/helpers/helper_functions.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: MyAppBar(showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MySizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Text("Зарегестрироваться", style: Theme.of(context).textTheme.headlineMedium,),
              const SizedBox(height: MySizes.spaceBtwSections,),

              ///Form
              const MySignupForm(),
              const SizedBox(height: MySizes.spaceBtwSections,),
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
              ///Social Button
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
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}


