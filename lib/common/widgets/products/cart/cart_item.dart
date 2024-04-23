import 'package:flutter/material.dart';
import 'package:sport_shop/common/widgets/images/rounded_image.dart';
import 'package:sport_shop/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:sport_shop/common/widgets/texts/product_title_text.dart';
import 'package:sport_shop/features/shop/models/cart_item_model.dart';
import 'package:sport_shop/utils/constants/colors.dart';
import 'package:sport_shop/utils/constants/image_strings.dart';
import 'package:sport_shop/utils/constants/sizes.dart';
import 'package:sport_shop/utils/helpers/helper_functions.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key, required this.cartItem,
  });

  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ///image
        MyRoundedImage(
          imageUrl: cartItem.image ?? '',
          width: 60,
          height: 60,
          isNetworkImage: true,
          padding: const EdgeInsets.all(MySizes.sm),
          backgroundColor: MyHelperFunctions.isDarkMode(context) ? MyColors.darkerGrey : MyColors.light,
        ),
        const SizedBox(width: MySizes.spaceBtwItems,),

        ///title, price, size
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyBrandTitleWithVerifiedIcon(title: (cartItem.brandName ?? '')),
            Flexible(child: MyProductTitleText(title: cartItem.title ,maxLines: 1,)),

            Text.rich(
                TextSpan(
                    children: (cartItem.selectedVariation ?? {}).entries.map((e) => TextSpan(children: [
                      TextSpan(text: ' ${e.key} ', style: Theme.of(context).textTheme.bodySmall),
                      TextSpan(text: ' ${e.value} ', style: Theme.of(context).textTheme.bodyLarge),
                    ])).toList(),
                )
            )
          ],
        )
      ],
    );
  }
}