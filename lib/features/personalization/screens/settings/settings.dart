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
import 'package:sport_shop/features/shop/screens/cart/cart.dart';
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
                MyAppBar(title: Text('Аккаунт', style: Theme.of(context).textTheme.headlineMedium!.apply(color: Colors.white),),),

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
                  const MySectionHeading(title: 'Настройки аккаунта'),
                  const SizedBox(height: MySizes.spaceBtwSections,),

                  SettingsMenuTile(icon: Iconsax.safe_home, title: 'Адреса', subtitle: 'Set shopping delivery address',onTap: () => Get.to(() => const UserAddressScreen()),),
                  SettingsMenuTile(icon: Iconsax.shopping_cart, title: 'Корзина', subtitle: 'Add, remove products and move to checkout',onTap: () => Get.to(() => const CartScreen()),),
                  SettingsMenuTile(icon: Iconsax.bag_tick, title: 'Заказы', subtitle: 'In-progress and completed orders',onTap: () => Get.to(() => const OrderScreen()),),
                  SettingsMenuTile(icon: Iconsax.discount_shape, title: 'Купоны', subtitle: 'List of all the discounted coupons',onTap: (){},),

                  ///app settings
                  const SizedBox(height: MySizes.spaceBtwSections,),
                  const MySectionHeading(title: 'Настройки приложения'),
                  const SizedBox(height: MySizes.spaceBtwItems,),
                  SettingsMenuTile(icon: Iconsax.document_upload, title: 'Загрузить данные', subtitle: 'Upload data to your cloud Firebase',onTap: () => CategoryRepository().uploadDummyData(DummyData.categories),),

                  const SizedBox(height: MySizes.spaceBtwSections,),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(onPressed: () => AuthenticationRepository.instance.logout(), child: const Text('Выйти из аккаунта'),),
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


