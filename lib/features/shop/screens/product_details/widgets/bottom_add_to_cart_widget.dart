import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sport_shop/common/widgets/icons/circular_icon.dart';
import 'package:sport_shop/features/shop/controllers/product/cart_controller.dart';
import 'package:sport_shop/features/shop/models/product_model.dart';
import 'package:sport_shop/utils/constants/colors.dart';
import 'package:sport_shop/utils/constants/sizes.dart';
import 'package:sport_shop/utils/helpers/helper_functions.dart';

class BottomAddToCart extends StatelessWidget {
  const BottomAddToCart({super.key, required this.product});
  
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    controller.updateAlreadyAddedProductCount(product);
    final dark = MyHelperFunctions.isDarkMode(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: MySizes.defaultSpace, vertical: MySizes.defaultSpace/2),
      decoration: BoxDecoration(
        color: dark ? MyColors.darkerGrey : MyColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(MySizes.cardRadiusLg),
          topRight: Radius.circular(MySizes.cardRadiusLg),
        )
      ),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
                children: [
                  CircularIcon(icon: Iconsax.minus, backgroundColor: MyColors.darkGrey, wigth: 40, height: 40, color: Colors.white,
                    onPressed:() => controller.productQuantityInCart.value < 1 ? null : controller.productQuantityInCart.value -= 1,),
                  const SizedBox(width: MySizes.spaceBtwItems,),
                  Text(controller.productQuantityInCart.value.toString(), style: Theme.of(context).textTheme.titleSmall,),
                  const SizedBox(width: MySizes.spaceBtwItems,),
                  CircularIcon(icon: Iconsax.add, backgroundColor: MyColors.black, wigth: 40, height: 40, color: Colors.white,
                  onPressed: () => controller.productQuantityInCart.value +=1,),
                ],
              ),
            ElevatedButton(
                onPressed: controller.productQuantityInCart.value < 1 ? null : () => controller.addToCart(product),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(MySizes.md),
                backgroundColor: Colors.black,
                side: BorderSide(color: Colors.black),
              ),
                child: const Text('В корзину'),
            )
          ],
        ),
      ),
    );
  }
}
