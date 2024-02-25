import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sport_shop/common/styles/shadows.dart';
import 'package:sport_shop/common/widgets/containers/rounded_container.dart';
import 'package:sport_shop/common/widgets/icons/circular_icon.dart';
import 'package:sport_shop/common/widgets/images/rounded_image.dart';
import 'package:sport_shop/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:sport_shop/common/widgets/texts/product_price_text.dart';
import 'package:sport_shop/common/widgets/texts/product_title_text.dart';
import 'package:sport_shop/utils/constants/colors.dart';
import 'package:sport_shop/utils/constants/image_strings.dart';
import 'package:sport_shop/utils/constants/sizes.dart';
import 'package:sport_shop/utils/helpers/helper_functions.dart';

class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);

    return Container(
        width: 310,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(MySizes.productImageRadius),
          color: dark ? MyColors.darkerGrey : MyColors.softGrey,
        ),
      child: Row(
        children: [
          MyRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(MySizes.sm),
            backgroundColor: dark ? MyColors.dark : MyColors.light,
            child: Stack(
              children: [
                SizedBox(
                    height: 120,
                    width: 120,
                    child: MyRoundedImage(imageUrl: MyImages.productImage3, applyImageRadius: true,)
                ),

                ///sale
                Positioned(
                  top: 10,
                  child: MyRoundedContainer(
                    radius: MySizes.sm,
                    backgroundColor: MyColors.secondary.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(horizontal: MySizes.sm, vertical: MySizes.xs),
                    child: Text("25%" ,style: Theme.of(context).textTheme.labelLarge!.apply(color: Colors.black),),
                  ),
                ),

                ///fav
                Positioned(top: 0, right: 0, child: CircularIcon(icon: Iconsax.heart5, color: Colors.red,)),
              ],
            ),
          ),

          ///details
          SizedBox(
            width: 172,
            child: Padding(
              padding: EdgeInsets.only(top: MySizes.sm, left: MySizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyProductTitleText(title: 'Red Nike boots', smallSize: true,),
                      SizedBox(height: MySizes.spaceBtwItems/2,),
                      MyBrandTitleWithVerifiedIcon(title: 'Nike')
                    ],
                  ),

                  const Spacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(child: MyProductPriceText(price: '100')),

                      ///add to cart button
                      Container(
                        decoration: const BoxDecoration(
                          color: MyColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(MySizes.cardRadiusMd),
                            bottomRight: Radius.circular(MySizes.productImageRadius),
                          ),
                        ),
                        child: const SizedBox(
                            width: MySizes.iconLg * 1.2,
                            height: MySizes.iconLg * 1.2,
                            child: Center(child: Icon(Iconsax.add, color: MyColors.white,))),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
