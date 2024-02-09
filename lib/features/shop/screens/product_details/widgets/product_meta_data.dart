import 'package:flutter/material.dart';
import 'package:sport_shop/common/widgets/containers/rounded_container.dart';
import 'package:sport_shop/common/widgets/images/circular_image.dart';
import 'package:sport_shop/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:sport_shop/common/widgets/texts/product_price_text.dart';
import 'package:sport_shop/common/widgets/texts/product_title_text.dart';
import 'package:sport_shop/utils/constants/colors.dart';
import 'package:sport_shop/utils/constants/enums.dart';
import 'package:sport_shop/utils/constants/sizes.dart';
import 'package:sport_shop/utils/helpers/helper_functions.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///price
        Row(
          children: [
            ///sale tag
            MyRoundedContainer(
              radius: MySizes.sm,
              backgroundColor: MyColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(horizontal: MySizes.sm, vertical: MySizes.xs),
              child: Text("25%" ,style: Theme.of(context).textTheme.labelLarge!.apply(color: Colors.black),),
            ),
            const SizedBox(width: MySizes.spaceBtwItems,),

            ///price
            Text('\$250', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),
            const SizedBox(width: MySizes.spaceBtwItems,),
            const MyProductPriceText(price: '175', isLarge: true),
          ],
        ),
        const SizedBox(height: MySizes.spaceBtwItems/1.5,),

        ///title
        const MyProductTitleText(title: 'Nike ball'),
        const SizedBox(height: MySizes.spaceBtwItems/1.5,),

        ///stock status
        Row(
          children: [
            const MyProductTitleText(title: 'Status'),
            const SizedBox(width: MySizes.spaceBtwItems,),
            Text('In Stock', style: Theme.of(context).textTheme.titleMedium,),
          ],
        ),
        const SizedBox(height: MySizes.spaceBtwItems/1.5,),

        ///brand
        Row(
          children: [
            MyCircularImage(image: 'assets/icons/categories/icons8-school-uniform-64.png', width: 32, height: 32, overlayColor: dark ? Colors.white : Colors.black,),
            const MyBrandTitleWithVerifiedIcon(title: 'Nike', brandTextSize: TextSizes.medium,),
          ],
        ),
        const SizedBox(height: MySizes.spaceBtwItems/1.5,),
      ],
    );
  }
}
