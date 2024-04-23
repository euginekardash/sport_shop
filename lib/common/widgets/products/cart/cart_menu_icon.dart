import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sport_shop/features/shop/controllers/product/cart_controller.dart';
import 'package:sport_shop/features/shop/screens/cart/cart.dart';
import 'package:sport_shop/utils/constants/colors.dart';

class MyCartCounterIcon extends StatelessWidget {
  const MyCartCounterIcon({
    super.key,
    this.iconColor,
  });

  final Color? iconColor;

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(CartController());

    return Stack(
      children: [
        IconButton(onPressed: () => Get.to(()=> CartScreen()), icon: Icon(Iconsax.shopping_bag, color: iconColor)),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: MyColors.black,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Obx(
                      ()=> Text(
                        controller.noOfCartItems.value.toString(),
                        style: Theme.of(context).textTheme.labelLarge!.apply(color: Colors.white,
                            fontSizeFactor: 0.8),
                      )
              ),
            ),
          ),
        )
      ],
    );
  }
}