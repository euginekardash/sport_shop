import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sport_shop/common/styles/shadows.dart';
import 'package:sport_shop/common/widgets/containers/rounded_container.dart';
import 'package:sport_shop/common/widgets/icons/circular_icon.dart';
import 'package:sport_shop/common/widgets/images/rounded_image.dart';
import 'package:sport_shop/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:sport_shop/common/widgets/texts/product_price_text.dart';
import 'package:sport_shop/common/widgets/texts/product_title_text.dart';
import 'package:sport_shop/features/shop/controllers/product_controller.dart';
import 'package:sport_shop/features/shop/models/product_model.dart';
import 'package:sport_shop/features/shop/screens/product_details/product_detail.dart';
import 'package:sport_shop/utils/constants/colors.dart';
import 'package:sport_shop/utils/constants/enums.dart';
import 'package:sport_shop/utils/constants/image_strings.dart';
import 'package:sport_shop/utils/constants/sizes.dart';
import 'package:sport_shop/utils/helpers/helper_functions.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = MyHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(() => ProductDetail(product: product,)),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [ShadowStile.verticalProductShadow],
          borderRadius: BorderRadius.circular(MySizes.productImageRadius),
          color: dark ? MyColors.darkerGrey : MyColors.white,
        ),
        child: Column(
          children: [
            ///Thumbnail, wishlist, discount
            MyRoundedContainer(
              height: 180,
              width: 180,
              padding: const EdgeInsets.all(MySizes.sm),
              backgroundColor: dark?MyColors.dark:MyColors.light,
              child: Stack(
                children: [
                  Center(child: MyRoundedImage(imageUrl: product.thumbnail, applyImageRadius: true, isNetworkImage: true,)),

                  ///sale
                  Positioned(
                    top: 10,
                    child: MyRoundedContainer(
                      radius: MySizes.sm,
                      backgroundColor: MyColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(horizontal: MySizes.sm, vertical: MySizes.xs),
                      child: Text("$salePercentage%" ,style: Theme.of(context).textTheme.labelLarge!.apply(color: Colors.black),),
                    ),
                  ),

                  ///fav
                  const Positioned(top: 0, right: 0, child: CircularIcon(icon: Iconsax.heart5, color: Colors.red,)),
                ],
              ),
            ),
            const SizedBox(height: MySizes.spaceBtwItems/2,),

            ///details
            Padding(
                padding: EdgeInsets.symmetric(horizontal: MySizes.sm),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyProductTitleText(title: product.title, smallSize: true,),
                      SizedBox(height: MySizes.spaceBtwItems/2,),
                      MyBrandTitleWithVerifiedIcon(title: product.brand!.name,),
                    ],
                  ),
                ),
            ),
            const Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                
                
                
                ///Price
                Flexible(
                  child: Column(
                    children: [
                      if(product.productType == ProductType.single.toString() && product.salePrice > 0)
                        Padding(
                          padding: EdgeInsets.only(left: MySizes.sm),
                          child: Text(
                            product.price.toString(),
                            style: Theme.of(context).textTheme.labelMedium!.apply(decoration: TextDecoration.lineThrough),
                          ),
                        ),
                      Padding(
                        padding: EdgeInsets.only(left: MySizes.sm),
                        child: MyProductPriceText(price: controller.getProductPrice(product), isLarge: false,),
                      ),
                    ],
                  ),
                ),

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
    );
  }
}








