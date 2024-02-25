import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sport_shop/common/widgets/containers/rounded_container.dart';
import 'package:sport_shop/utils/constants/colors.dart';
import 'package:sport_shop/utils/constants/sizes.dart';
import 'package:sport_shop/utils/helpers/helper_functions.dart';

class OrderListItems extends StatelessWidget {
  const OrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 5,
      separatorBuilder: (_, __) => const SizedBox(height: MySizes.spaceBtwItems,),
      itemBuilder: (_, index) => MyRoundedContainer(
        showBorder: true,
        padding: const EdgeInsets.all(MySizes.md),
        backgroundColor: dark ? MyColors.dark : MyColors.light,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Icon(Iconsax.ship),
                SizedBox(width: MySizes.spaceBtwItems/2,),

                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Processing', style: Theme.of(context).textTheme.bodyLarge!.apply(color: MyColors.primary, fontSizeDelta: 1),),
                      Text('7 Nov, 2024', style: Theme.of(context).textTheme.headlineSmall,),
                    ],

                  ),
                ),

                IconButton(onPressed: (){}, icon: const Icon(Iconsax.arrow_right_34, size: MySizes.iconSm,))
              ],
            ),
            const SizedBox(height: MySizes.spaceBtwItems,),

            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Icon(Iconsax.ship),
                      SizedBox(width: MySizes.spaceBtwItems/2,),

                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Order', style: Theme.of(context).textTheme.labelMedium),
                            Text('[#56384]', style: Theme.of(context).textTheme.titleMedium,),
                          ],

                        ),
                      ),

                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Icon(Iconsax.calendar),
                      SizedBox(width: MySizes.spaceBtwItems/2,),

                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Shipping date', style: Theme.of(context).textTheme.labelMedium),
                            Text('3 Feb, 2024', style: Theme.of(context).textTheme.titleMedium,),
                          ],

                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
