import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sport_shop/features/personalization/screens/settings/settings.dart';
import 'package:sport_shop/features/shop/screens/home/home.dart';
import 'package:sport_shop/features/shop/screens/store/store.dart';
import 'package:sport_shop/features/shop/screens/wishlist/wishlist.dart';
import 'package:sport_shop/utils/constants/colors.dart';
import 'package:sport_shop/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = MyHelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 60,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          backgroundColor: darkMode ? MyColors.black : Colors.white,
          indicatorColor: darkMode ? MyColors.white.withOpacity(0.1) : MyColors.black.withOpacity(0.1),

          destinations:const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Главное'),
            NavigationDestination(icon: Icon(Iconsax.shop), label: 'Магазин'),
            NavigationDestination(icon: Icon(Iconsax.heart), label: 'Избранное'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Профиль'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;

  final screens = [const HomeScreen(), const StoreScreen(),const FavouriteScreen(),const SettingsScreen(),];
}
