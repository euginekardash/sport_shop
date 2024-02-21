import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sport_shop/common/widgets/icons/circular_icon.dart';
import 'package:sport_shop/utils/constants/colors.dart';
import 'package:sport_shop/utils/constants/sizes.dart';
import 'package:sport_shop/utils/helpers/helper_functions.dart';

class ProductQuantity extends StatelessWidget {
  const ProductQuantity({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularIcon(
          icon: Iconsax.minus,
          wigth: 32,
          height: 32,
          size: MySizes.md,
          color: MyHelperFunctions.isDarkMode(context) ? Colors.white : Colors.black,
          backgroundColor: MyHelperFunctions.isDarkMode(context) ? MyColors.darkerGrey : MyColors.light,
        ),
        const SizedBox(width: MySizes.spaceBtwItems,),
        Text('2', style: Theme.of(context).textTheme.titleSmall,),
        const SizedBox(width: MySizes.spaceBtwItems,),

        const CircularIcon(
          icon: Iconsax.add,
          wigth: 32,
          height: 32,
          size: MySizes.md,
          color: Colors.white,
          backgroundColor: MyColors.primary,
        ),
      ],
    );
  }
}