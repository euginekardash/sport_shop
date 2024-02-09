import 'package:flutter/material.dart';
import 'package:sport_shop/common/widgets/chips/choice_chip.dart';
import 'package:sport_shop/common/widgets/containers/rounded_container.dart';
import 'package:sport_shop/common/widgets/texts/product_price_text.dart';
import 'package:sport_shop/common/widgets/texts/product_title_text.dart';
import 'package:sport_shop/common/widgets/texts/section_heading.dart';
import 'package:sport_shop/utils/constants/colors.dart';
import 'package:sport_shop/utils/constants/sizes.dart';
import 'package:sport_shop/utils/helpers/helper_functions.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        MyRoundedContainer(
          padding: const EdgeInsets.all(MySizes.md),
          backgroundColor: dark ? MyColors.darkerGrey : MyColors.grey,
          child: Column(
            children: [
              ///title
              Row(
                children: [
                  const MySectionHeading(title: 'Variation', showActionButton: false,),
                  const SizedBox(width: MySizes.spaceBtwItems,),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const MyProductTitleText(title: 'Price: ', smallSize: true,),
                          ///actual price
                          Text('\$25', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),

                          const SizedBox(width: MySizes.spaceBtwItems,),
                          ///sale price
                          const MyProductPriceText(price: '20'),
                        ],
                      ),

                      ///stock
                      Row(
                        children: [
                          const MyProductTitleText(title: 'Stock : ', smallSize: true,),
                          Text('In stock', style: Theme.of(context).textTheme.titleMedium,),
                        ],
                      )
                    ],
                  ),

                ],
              ),
              ///variation desc
              const MyProductTitleText(
                title: 'This is the Description of the product and it can go upto max 4 lenws.',
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),
        const SizedBox(height: MySizes.spaceBtwItems,),

        ///attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MySectionHeading(title: 'Colors'),
            const SizedBox(height: MySizes.spaceBtwItems/2,),
            Wrap(
              spacing: 8,
              children: [
                MyChoiceChip(text: 'Green', selected: true, onSelected: (value){},),
                MyChoiceChip(text: 'Blue', selected: false, onSelected: (value){},),
                MyChoiceChip(text: 'Yellow', selected: false, onSelected: (value){},),
              ],
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MySectionHeading(title: 'Size'),
            SizedBox(height: MySizes.spaceBtwItems/2,),
            Wrap(
              spacing: 8,
              children: [
                MyChoiceChip(text: '60 sm', selected: true, onSelected: (value){},),
                MyChoiceChip(text: '65 sm', selected: false, onSelected: (value){},),
                MyChoiceChip(text: '70 sm', selected: false, onSelected: (value){},),
              ],
            )
          ],
        ),
      ],
    );
  }
}


