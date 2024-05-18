import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sport_shop/common/widgets/appbar/appbar.dart';
import 'package:sport_shop/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:sport_shop/common/widgets/list_tile/setting_menu_tile.dart';
import 'package:sport_shop/common/widgets/list_tile/user_profile_tile.dart';
import 'package:sport_shop/common/widgets/texts/section_heading.dart';
import 'package:sport_shop/data/repositories/authentication_repository.dart';
import 'package:sport_shop/features/personalization/screens/address/adress.dart';
import 'package:sport_shop/features/personalization/screens/profile/profile.dart';
import 'package:sport_shop/features/shop/screens/cart/cart.dart';
import 'package:sport_shop/features/shop/screens/order/order.dart';
import 'package:sport_shop/utils/constants/sizes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userId = AuthenticationRepository.instance.authUser.uid;
    print(userId);

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

                  SettingsMenuTile(icon: Iconsax.safe_home, title: 'Адреса', subtitle: 'Установите адрес доставки',onTap: () => Get.to(() => const UserAddressScreen()),),
                  SettingsMenuTile(icon: Iconsax.shopping_cart, title: 'Корзина', subtitle: 'Добавляйте, удаляйте товары и переходите к оформлению заказа',onTap: () => Get.to(() => const CartScreen()),),
                  SettingsMenuTile(icon: Iconsax.bag_tick, title: 'Заказы', subtitle: 'Незавершенные и выполненные заказы',onTap: () => Get.to(() => const OrderScreen()),),

                  ///app settings

                  //SettingsMenuTile(icon: Iconsax.document_upload, title: 'Загрузить данные', subtitle: 'Загрузите данные в базу данных',onTap: () => CategoryRepository().uploadDummyData(DummyData.categories),),
                  // if (userId == 'zfsdeta9DMUwcMYemGP10XV9eiq2')
                  //   const SizedBox(height: MySizes.spaceBtwSections,),
                  //   const MySectionHeading(title: 'Настройки приложения'),
                  //   const SizedBox(height: MySizes.spaceBtwItems,),
                  //   SettingsMenuTile(icon: Iconsax.document_upload, title: 'Загрузить данные', subtitle: 'Загрузите данные в базу данных',onTap: () => CategoryRepository().uploadDummyData(DummyData.categories),),

                  const SizedBox(height: 230,),
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


