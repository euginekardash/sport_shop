import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:sport_shop/common/widgets/chips/choice_chip.dart';
import 'package:sport_shop/common/widgets/containers/rounded_container.dart';
import 'package:sport_shop/common/widgets/texts/product_price_text.dart';
import 'package:sport_shop/common/widgets/texts/product_title_text.dart';
import 'package:sport_shop/common/widgets/texts/section_heading.dart';
import 'package:sport_shop/features/shop/controllers/variation_controller.dart';
import 'package:sport_shop/features/shop/models/product_model.dart';
import 'package:sport_shop/utils/constants/colors.dart';
import 'package:sport_shop/utils/constants/sizes.dart';
import 'package:sport_shop/utils/helpers/helper_functions.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VariationController());
    final dark = MyHelperFunctions.isDarkMode(context);
    return Obx(
        () => Column(
        children: [
          if(controller.selectedVariation.value.id.isNotEmpty)
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
                            if(controller.selectedVariation.value.salePrice > 0)
                            Text('\$${controller.selectedVariation.value.price}', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),

                            const SizedBox(width: MySizes.spaceBtwItems,),
                            ///sale price
                            MyProductPriceText(price: controller.getVariationPrice()),
                          ],
                        ),

                        ///stock
                        Row(
                          children: [
                            const MyProductTitleText(title: 'Stock : ', smallSize: true,),
                            Text(controller.variationStockStatus.value, style: Theme.of(context).textTheme.titleMedium,),
                          ],
                        )
                      ],
                    ),

                  ],
                ),
                ///variation desc
                MyProductTitleText(
                  title: controller.selectedVariation.value.description ?? '',
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
            children: product.productAttributes!.map((attribute) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MySectionHeading(title: attribute.name ?? ''),
                const SizedBox(height: MySizes.spaceBtwItems/2,),
                Obx(()=> Wrap(
                    spacing: 8,
                    children: attribute.values!
                        .map((attributeValue) {

                          final isSelected = controller.selectedAttributes[attribute.name] == attributeValue;
                          final available = controller
                            .getAttributesAvailabilityInVariation(product.productVariations!, attribute.name!)
                            .contains(attributeValue);

                          return MyChoiceChip(text: attributeValue, selected: isSelected, onSelected: available ? (selected){
                            if(selected && available){
                              controller.onAttributeSelected(product, attribute.name ?? '', attributeValue);
                            }
                          } : null,);
                    } ).toList(),
                  ),
                )
              ],
            ),
            ).toList(),
          ),

        ],
      ),
    );
  }
}


