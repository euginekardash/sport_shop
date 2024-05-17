import 'package:flutter/material.dart';
import 'package:sport_shop/common/widgets/containers/rounded_container.dart';
import 'package:sport_shop/common/widgets/images/circular_image.dart';
import 'package:sport_shop/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:sport_shop/common/widgets/texts/product_price_text.dart';
import 'package:sport_shop/common/widgets/texts/product_title_text.dart';
import 'package:sport_shop/features/shop/controllers/product_controller.dart';
import 'package:sport_shop/features/shop/models/product_model.dart';
import 'package:sport_shop/utils/constants/colors.dart';
import 'package:sport_shop/utils/constants/enums.dart';
import 'package:sport_shop/utils/constants/sizes.dart';
import 'package:sport_shop/utils/helpers/helper_functions.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = MyHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///price
        Row(
          children: [
            ///sale tag
            // MyRoundedContainer(
            //   radius: MySizes.sm,
            //   backgroundColor: MyColors.secondary.withOpacity(0.8),
            //   padding: const EdgeInsets.symmetric(horizontal: MySizes.sm, vertical: MySizes.xs),
            //   child: Text("$salePercentage%" ,style: Theme.of(context).textTheme.labelLarge!.apply(color: Colors.black),),
            // ),
            // const SizedBox(width: MySizes.spaceBtwItems,),

            ///price
            if(product.productType == ProductType.single.toString() && product.salePrice > 0)
              Text('${product.price}р.', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),
            if(product.productType == ProductType.single.toString() && product.salePrice > 0)
              const SizedBox(width: MySizes.spaceBtwItems,),
            MyProductPriceText(price: controller.getProductPrice(product), isLarge: true),
          ],
        ),
        const SizedBox(height: MySizes.spaceBtwItems/1.5,),

        ///title
        MyProductTitleText(title: product.title),
        const SizedBox(height: MySizes.spaceBtwItems/1.5,),

        ///stock status
        // Row(
        //   children: [
        //     const MyProductTitleText(title: 'Наличие'),
        //     const SizedBox(width: MySizes.spaceBtwItems,),
        //     Text(controller.getProductStockStatus(product.stock), style: Theme.of(context).textTheme.titleMedium,),
        //   ],
        // ),
        const SizedBox(height: MySizes.spaceBtwItems/1.5,),

        ///brand
        Row(
          children: [
            MyCircularImage(isNetworkImage: true, image: product.brand != null ? product.brand!.image : '', width: 32, height: 32, overlayColor: dark ? Colors.white : Colors.black,),
            MyBrandTitleWithVerifiedIcon(title: product.brand != null ? product.brand!.name : '', brandTextSize: TextSizes.medium,),
          ],
        ),
        const SizedBox(height: MySizes.spaceBtwItems/1.5,),
      ],
    );
  }
}
