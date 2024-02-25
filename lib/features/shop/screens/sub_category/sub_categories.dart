import 'package:flutter/material.dart';
import 'package:sport_shop/common/widgets/appbar/appbar.dart';
import 'package:sport_shop/common/widgets/images/rounded_image.dart';
import 'package:sport_shop/common/widgets/products/products_cards/product_card_horizontal.dart';
import 'package:sport_shop/common/widgets/texts/section_heading.dart';
import 'package:sport_shop/utils/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: Text('Sports shirts'), showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(MySizes.defaultSpace),
          child: Column(
            children: [
              ///Banner
              MyRoundedImage(imageUrl: 'assets/images/banners/promo-banner-1.png', width: double.infinity, applyImageRadius: true,),
              const SizedBox(height: MySizes.spaceBtwSections,),

              ///sub
              Column(
                children: [
                  MySectionHeading(title: 'Sport shirts', showActionButton: true, onPressed: (){},),
                  const SizedBox(height: MySizes.spaceBtwItems/2,),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4,
                        scrollDirection:Axis.horizontal,
                        separatorBuilder: (context, index) => const SizedBox(width: MySizes.spaceBtwItems,),
                        itemBuilder: (context, index) => const ProductCardHorizontal()
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
