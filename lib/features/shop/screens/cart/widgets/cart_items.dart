import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_shop/common/widgets/products/cart/add_remove_button.dart';
import 'package:sport_shop/common/widgets/products/cart/cart_item.dart';
import 'package:sport_shop/common/widgets/texts/product_price_text.dart';
import 'package:sport_shop/features/shop/controllers/product/cart_controller.dart';
import 'package:sport_shop/utils/constants/sizes.dart';

class CartItems extends StatelessWidget {
  const CartItems({super.key,  this.showAddRemoveButtons = true});

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;

    return Obx(
      () => ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (_, __) =>  const SizedBox(
          height: MySizes.spaceBtwSections,
        ),
        itemCount: cartController.cartItems.length,
        itemBuilder: (_, index) => Obx(
          (){
            final item = cartController.cartItems[index];
            return Column(
            children: [
              CartItem(cartItem: item,),
              if(showAddRemoveButtons)const SizedBox(height: MySizes.spaceBtwItems,),

              if(showAddRemoveButtons)Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 70,),
                      ///remove but
                      ProductQuantity(quantity: item.quantity, add: () => cartController.addOneToCart(item),
                        remove: () => cartController.removeOneFromCart(item),),
                    ],
                  ),

                  MyProductPriceText(price: (item.price * item.quantity).toStringAsFixed(1)),

                ],
              ),
            ],
          );}
        ),
      ),
    );
  }
}
