import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sport_shop/common/widgets/layouts/grid_layout.dart';
import 'package:sport_shop/common/widgets/products/products_cards/product_card_vertical.dart';
import 'package:sport_shop/features/shop/models/product_model.dart';
import 'package:sport_shop/utils/constants/sizes.dart';

class SortableProducts extends StatelessWidget {
  const SortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
            decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
            items: ['Name', 'Higher price', 'Lower price', 'Sale', 'Newest', 'Popularity'
            ].map((option) => DropdownMenuItem(value: option, child: Text(option))).toList(),
            onChanged: (value){}
        ),
        const SizedBox(height: MySizes.spaceBtwSections,),

        MyGridLayout(itemCount: 4, itemBuilder: (_, index) => ProductCardVertical(product: ProductModel.empty(),)),
      ],
    );
  }
}