import 'package:flutter/material.dart';
import 'package:sport_shop/common/widgets/images/rounded_image.dart';
import 'package:sport_shop/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:sport_shop/common/widgets/texts/product_title_text.dart';
import 'package:sport_shop/utils/constants/colors.dart';
import 'package:sport_shop/utils/constants/image_strings.dart';
import 'package:sport_shop/utils/constants/sizes.dart';
import 'package:sport_shop/utils/helpers/helper_functions.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ///image
        MyRoundedImage(imageUrl: MyImages.productImage1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(MySizes.sm),
          backgroundColor: MyHelperFunctions.isDarkMode(context) ? MyColors.darkerGrey : MyColors.light,
        ),
        const SizedBox(width: MySizes.spaceBtwItems,),

        ///title, price, size
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MyBrandTitleWithVerifiedIcon(title: ('Nike')),
            const Flexible(child: MyProductTitleText(title: 'White ball' ,maxLines: 1,)),
            Text.rich(
                TextSpan(
                    children: [
                      TextSpan(text: 'Color', style: Theme.of(context).textTheme.bodySmall),
                      TextSpan(text: 'Green', style: Theme.of(context).textTheme.bodyLarge),
                      TextSpan(text: 'Size', style: Theme.of(context).textTheme.bodySmall),
                      TextSpan(text: '38', style: Theme.of(context).textTheme.bodyLarge),
                    ]
                )
            )
          ],
        )
      ],
    );
  }
}