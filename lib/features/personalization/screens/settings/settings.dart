import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sport_shop/common/widgets/appbar/appbar.dart';
import 'package:sport_shop/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:sport_shop/common/widgets/list_tile/setting_menu_tile.dart';
import 'package:sport_shop/common/widgets/list_tile/user_profile_tile.dart';
import 'package:sport_shop/common/widgets/texts/section_heading.dart';
import 'package:sport_shop/data/repositories/authentication_repository.dart';
import 'package:sport_shop/data/repositories/banners/banner_repository.dart';
import 'package:sport_shop/data/repositories/brands/brand_repository.dart';
import 'package:sport_shop/data/repositories/categories/category_repository.dart';
import 'package:sport_shop/data/repositories/product/product_repository.dart';
import 'package:sport_shop/features/personalization/screens/address/adress.dart';
import 'package:sport_shop/features/personalization/screens/profile/profile.dart';
import 'package:sport_shop/features/shop/controllers/category_controller.dart';
import 'package:sport_shop/features/shop/screens/order/order.dart';
import 'package:sport_shop/utils/constants/sizes.dart';
import 'package:sport_shop/utils/dummy/dummy_data.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///header
            MyPrimaryHeaderContainer(child: Column(
              children: [
                ///appbar
                MyAppBar(title: Text('Account', style: Theme.of(context).textTheme.headlineMedium!.apply(color: Colors.white),),),

                ///profile
                MyUserProfileTile(onPressed: () => Get.to(() => const ProfileScreen()),),
                const SizedBox(height: MySizes.spaceBtwSections,),
              ],
            )
            ),
            
            ///body
            Padding(
              padding: const EdgeInsets.all(MySizes.defaultSpace),
              child: Column(
                children: [
                  const MySectionHeading(title: 'Account settings'),
                  const SizedBox(height: MySizes.spaceBtwSections,),

                  SettingsMenuTile(icon: Iconsax.safe_home, title: 'My addresses', subtitle: 'Set shopping delivery address',onTap: () => Get.to(() => const UserAddressScreen()),),
                  SettingsMenuTile(icon: Iconsax.shopping_cart, title: 'My cart', subtitle: 'Add, remove products and move to checkout',onTap: (){},),
                  SettingsMenuTile(icon: Iconsax.bag_tick, title: 'My orders', subtitle: 'In-progress and completed orders',onTap: () => Get.to(() => const OrderScreen()),),
                  SettingsMenuTile(icon: Iconsax.bank, title: 'Bank account', subtitle: 'Withdraw balance to registered bank account',onTap: (){},),
                  SettingsMenuTile(icon: Iconsax.discount_shape, title: 'My coupons', subtitle: 'List of all the discounted coupons',onTap: (){},),
                  SettingsMenuTile(icon: Iconsax.notification, title: 'Notifications', subtitle: 'Set any kind of notification message',onTap: (){},),
                  SettingsMenuTile(icon: Iconsax.security_card, title: 'Account privacy', subtitle: 'Manage data usage and connected accounts',onTap: (){},),

                  ///app settings
                  const SizedBox(height: MySizes.spaceBtwSections,),
                  const MySectionHeading(title: 'App settings'),
                  const SizedBox(height: MySizes.spaceBtwItems,),
                  SettingsMenuTile(icon: Iconsax.document_upload, title: 'Load data', subtitle: 'Upload data to your cloud Firebase',onTap: () => BrandRepository().uploadDummyData(DummyData.brands),),
                  SettingsMenuTile(
                    icon: Iconsax.location,
                    title: 'Geolocation',
                    subtitle: 'Set recommendation based on location',
                    trailing: Switch(value: true, onChanged: (value){},),
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Safe mode',
                    subtitle: 'Search result is safe for all ages',
                    trailing: Switch(value: false, onChanged: (value){},),
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.image,
                    title: 'HD image quality',
                    subtitle: 'Set image quality to be seen',
                    trailing: Switch(value: false, onChanged: (value){},),
                  ),

                  const SizedBox(height: MySizes.spaceBtwSections,),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(onPressed: () => AuthenticationRepository.instance.logout(), child: const Text('Logout'),),
                  ),
                  const SizedBox(height: MySizes.spaceBtwSections * 2.5,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


