import 'package:flutter/material.dart';
import 'package:sport_shop/common/widgets/brands/brand_show_case.dart';
import 'package:sport_shop/common/widgets/layouts/grid_layout.dart';
import 'package:sport_shop/common/widgets/products/products_cards/product_card_vertical.dart';
import 'package:sport_shop/common/widgets/texts/section_heading.dart';
import 'package:sport_shop/features/shop/models/category_model.dart';
import 'package:sport_shop/utils/constants/sizes.dart';

class MyCategoryTab extends StatelessWidget {
  const MyCategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(MySizes.defaultSpace),
          child: Column(
            children: [
              ///brands
              const MyBrandShowcase(images: ['assets/images/products/product-jacket.png', 'assets/images/products/product-jacket.png', 'assets/images/products/product-jacket.png'],),
              const MyBrandShowcase(images: ['assets/images/products/product-jacket.png', 'assets/images/products/product-jacket.png', 'assets/images/products/product-jacket.png'],),
              const SizedBox(height: MySizes.spaceBtwItems,),

              ///products
              MySectionHeading(title: 'You might like', showActionButton: true, onPressed: () {}),
              const SizedBox(height: MySizes.spaceBtwItems,),

              MyGridLayout(itemCount: 4, itemBuilder: (_, index) => const ProductCardVertical()),
              const SizedBox(height: MySizes.spaceBtwItems,),
            ],
          ),
        ),
      ]
    );
  }
}
