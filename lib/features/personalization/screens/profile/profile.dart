import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sport_shop/common/widgets/appbar/appbar.dart';
import 'package:sport_shop/common/widgets/images/circular_image.dart';
import 'package:sport_shop/common/widgets/texts/section_heading.dart';
import 'package:sport_shop/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:sport_shop/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: Text('Profile'),
        showBackArrow: true,
      ),
      ///body
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(MySizes.defaultSpace),
          child: Column(
            children: [
              ///Image
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    MyCircularImage(image: 'assets/images/user/user.png', width: 80, height: 80,),
                    TextButton(onPressed: (){}, child: Text('Change profile picture', style: Theme.of(context).textTheme.labelMedium,)),
                  ],
                ),
              ),

              const SizedBox(height: MySizes.spaceBtwItems/2,),
              const Divider(),
              const SizedBox(height: MySizes.spaceBtwItems),

              const MySectionHeading(title: 'Profile information'),
              const SizedBox(height: MySizes.spaceBtwItems),

              ProfileMenu(title: "Name", value: 'Eugene Kardash', onPressed: (){},),
              ProfileMenu(title: "Username", value: 'eugene_kardash', onPressed: (){},),

              const SizedBox(height: MySizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: MySizes.spaceBtwItems),

              const MySectionHeading(title: 'Personal information'),
              const SizedBox(height: MySizes.spaceBtwItems),

              ProfileMenu(title: "User ID", value: '37594',icon: Iconsax.copy, onPressed: (){},),///очибка нет иконки
              ProfileMenu(title: "E-mail", value: 'eugene_kardash@gmail.com', onPressed: (){},),
              ProfileMenu(title: "Phone number", value: '+375447189386', onPressed: (){},),
              ProfileMenu(title: "Gender", value: 'Male', onPressed: (){},),
              ProfileMenu(title: "Date of birth", value: '5 May, 2003', onPressed: (){},),
              const Divider(),
              const SizedBox(height: MySizes.spaceBtwItems),

              Center(
                child: TextButton(
                  onPressed: (){},
                  child: const Text('Close Account', style: TextStyle(color: Colors.red),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


