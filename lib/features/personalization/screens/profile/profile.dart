import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sport_shop/common/styles/shimmer.dart';
import 'package:sport_shop/common/widgets/appbar/appbar.dart';
import 'package:sport_shop/common/widgets/images/circular_image.dart';
import 'package:sport_shop/common/widgets/texts/section_heading.dart';
import 'package:sport_shop/features/personalization/controllers/user_controller.dart';
import 'package:sport_shop/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:sport_shop/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:sport_shop/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
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
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image = networkImage.isNotEmpty ? networkImage : 'assets/images/user/user.png';
                      return controller.imageUploading.value
                       ? const ShimmerEffect(width: 80, height: 80, radius: 80,)
                       : MyCircularImage(image: image, width: 90, height: 90, isNetworkImage: networkImage.isNotEmpty,);
                    }),
                    TextButton(onPressed: () => controller.uploadUserProfilePicture(), child: Text('Change profile picture', style: Theme.of(context).textTheme.labelMedium,)),
                  ],
                ),
              ),

              const SizedBox(height: MySizes.spaceBtwItems/2,),
              const Divider(),
              const SizedBox(height: MySizes.spaceBtwItems),

              const MySectionHeading(title: 'Profile information'),
              const SizedBox(height: MySizes.spaceBtwItems),

              ProfileMenu(title: "Name", value: controller.user.value.fullName, onPressed: () => Get.to(() => const ChangeName()),),
              ProfileMenu(title: "Username", value: controller.user.value.username, onPressed: (){},),

              const SizedBox(height: MySizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: MySizes.spaceBtwItems),

              const MySectionHeading(title: 'Personal information'),
              const SizedBox(height: MySizes.spaceBtwItems),

              ProfileMenu(title: "User ID", value: controller.user.value.id,icon: Iconsax.copy, onPressed: (){},),///очибка нет иконки
              ProfileMenu(title: "E-mail", value: controller.user.value.email, onPressed: (){},),
              ProfileMenu(title: "Phone number", value: controller.user.value.phoneNumber, onPressed: (){},),
              ProfileMenu(title: "Gender", value: 'Male', onPressed: (){},),
              ProfileMenu(title: "Date of birth", value: '5 May, 2003', onPressed: (){},),
              const Divider(),
              const SizedBox(height: MySizes.spaceBtwItems),

              Center(
                child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(),
                  child: const Text('Delete Account', style: TextStyle(color: Colors.red),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


