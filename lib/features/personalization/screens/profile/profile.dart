import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        title: Text('Профиль'),
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
                    TextButton(onPressed: () => controller.uploadUserProfilePicture(), child: Text('Изменить фото', style: Theme.of(context).textTheme.labelMedium,)),
                  ],
                ),
              ),

              const SizedBox(height: MySizes.spaceBtwItems/2,),
              const Divider(),
              const SizedBox(height: MySizes.spaceBtwItems),

              const MySectionHeading(title: 'Ифнормация о пользователе'),
              const SizedBox(height: MySizes.spaceBtwItems),

              ProfileMenu(title: "Имя", value: controller.user.value.fullName,icon: Iconsax.arrow_right_34, onPressed: () => Get.to(() => const ChangeName()),),
              ProfileMenu(title: "Никнейм", value: controller.user.value.username, onPressed: (){},),

              const SizedBox(height: MySizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: MySizes.spaceBtwItems),

              const MySectionHeading(title: 'Персональная информация'),
              const SizedBox(height: MySizes.spaceBtwItems),

              ProfileMenu(
                title: "ID",
                value: controller.user.value.id,
                icon: Iconsax.copy,
                onPressed: ()async{await Clipboard.setData(ClipboardData(text: controller.user.value.id)).then((_) => {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Ваш ID скопирован')))});
                },
              ),
              ProfileMenu(title: "Почта", value: controller.user.value.email, onPressed: (){},),
              ProfileMenu(title: "Номер телефона", value: controller.user.value.phoneNumber, onPressed: (){},),
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


