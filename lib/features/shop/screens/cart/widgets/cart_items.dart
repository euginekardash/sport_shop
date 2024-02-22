import 'package:flutter/material.dart';
import 'package:sport_shop/common/widgets/products/cart/add_remove_button.dart';
import 'package:sport_shop/common/widgets/products/cart/cart_item.dart';
import 'package:sport_shop/common/widgets/texts/product_price_text.dart';
import 'package:sport_shop/utils/constants/sizes.dart';

class CartItems extends StatelessWidget {
  const CartItems({super.key,  this.showAddRemoveButtons = true});

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) =>  const SizedBox(
        height: MySizes.spaceBtwSections,
      ),
      itemCount: 2,
      itemBuilder: (_, index) =>   Column(
        children: [
          const CartItem(),
          if(showAddRemoveButtons)const SizedBox(height: MySizes.spaceBtwItems,),

          if(showAddRemoveButtons)const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(width: 70,),
                  ///remove but
                  ProductQuantity(),
                ],
              ),

              MyProductPriceText(price: '255'),

            ],
          ),
        ],
      ),
    );
  }
}
