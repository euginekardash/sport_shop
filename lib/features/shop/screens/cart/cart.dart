import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sport_shop/common/widgets/appbar/appbar.dart';
import 'package:sport_shop/common/widgets/icons/circular_icon.dart';
import 'package:sport_shop/common/widgets/images/rounded_image.dart';
import 'package:sport_shop/common/widgets/loaders/animation_loader.dart';
import 'package:sport_shop/common/widgets/products/cart/add_remove_button.dart';
import 'package:sport_shop/common/widgets/products/cart/cart_item.dart';
import 'package:sport_shop/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:sport_shop/common/widgets/texts/product_price_text.dart';
import 'package:sport_shop/common/widgets/texts/product_title_text.dart';
import 'package:sport_shop/features/shop/controllers/product/cart_controller.dart';
import 'package:sport_shop/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:sport_shop/features/shop/screens/checkout/checkout.dart';
import 'package:sport_shop/navigation_menu.dart';
import 'package:sport_shop/utils/constants/colors.dart';
import 'package:sport_shop/utils/constants/image_strings.dart';
import 'package:sport_shop/utils/constants/sizes.dart';
import 'package:sport_shop/utils/helpers/helper_functions.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;

    return Scaffold(
      appBar: MyAppBar(
        title: Text('Корзина', style: Theme.of(context).textTheme.headlineSmall,),
        showBackArrow: true,
      ),
      body: Obx(
        () {



          final emptyWidget = MyAnimationLoaderWidget(
            text: 'Корзина пуста',
            animation: 'assets/images/animations/loading.json',
            showAction: true,
            actionText: 'Давайте ее заполним',
            onActionPressed: () => Get.off(() => const NavigationMenu()),
          );

          if (controller.cartItems.isEmpty) {
            return emptyWidget;
          } else {
            return const SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(MySizes.defaultSpace),
                child: CartItems(),
              ),
            );
          }}
      ),
      bottomNavigationBar:controller.cartItems.isEmpty ? SizedBox() : Padding(
        padding: const EdgeInsets.all(MySizes.defaultSpace),
        child: ElevatedButton(onPressed: () => Get.to(() => const CheckoutScreen()), child: Obx(() => Text('К оформлению \$${controller.totalCartPrice.value}')),),
      ),
    );
  }
}



