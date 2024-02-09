import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sport_shop/common/widgets/icons/circular_icon.dart';
import 'package:sport_shop/utils/constants/colors.dart';
import 'package:sport_shop/utils/constants/sizes.dart';
import 'package:sport_shop/utils/helpers/helper_functions.dart';

class BottomAddToCart extends StatelessWidget {
  const BottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: MySizes.defaultSpace, vertical: MySizes.defaultSpace/2),
      decoration: BoxDecoration(
        color: dark ? MyColors.darkerGrey : MyColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(MySizes.cardRadiusLg),
          topRight: Radius.circular(MySizes.cardRadiusLg),
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircularIcon(icon: Iconsax.minus, backgroundColor: MyColors.darkGrey, wigth: 40, height: 40, color: Colors.white,),
              const SizedBox(width: MySizes.spaceBtwItems,),
              Text('2', style: Theme.of(context).textTheme.titleSmall,),
              const SizedBox(width: MySizes.spaceBtwItems,),
              const CircularIcon(icon: Iconsax.add, backgroundColor: MyColors.black, wigth: 40, height: 40, color: Colors.white,),
            ],
          ),
          ElevatedButton(
              onPressed: (){},
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(MySizes.md),
              backgroundColor: Colors.black,
              side: BorderSide(color: Colors.black),
            ),
              child: const Text('Add to cart'),
          )
        ],
      ),
    );
  }
}
