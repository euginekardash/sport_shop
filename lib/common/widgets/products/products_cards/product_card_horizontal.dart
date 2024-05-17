import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sport_shop/common/styles/shadows.dart';
import 'package:sport_shop/common/widgets/containers/rounded_container.dart';
import 'package:sport_shop/common/widgets/icons/circular_icon.dart';
import 'package:sport_shop/common/widgets/images/rounded_image.dart';
import 'package:sport_shop/common/widgets/products/favourite_icon/favourite_icon.dart';
import 'package:sport_shop/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:sport_shop/common/widgets/texts/product_price_text.dart';
import 'package:sport_shop/common/widgets/texts/product_title_text.dart';
import 'package:sport_shop/features/shop/controllers/product_controller.dart';
import 'package:sport_shop/features/shop/models/product_model.dart';
import 'package:sport_shop/utils/constants/colors.dart';
import 'package:sport_shop/utils/constants/image_strings.dart';
import 'package:sport_shop/utils/constants/sizes.dart';
import 'package:sport_shop/utils/helpers/helper_functions.dart';

import '../../../../features/shop/controllers/product/cart_controller.dart';
import '../../../../features/shop/screens/product_details/product_detail.dart';
import '../../../../utils/constants/enums.dart';

class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);

    final controller = ProductController.instance;
    final cartController = CartController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);

    return GestureDetector(
      onTap: () => Get.to(() => ProductDetail(product: product,)),
      child: Container(
          width: 310,
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(MySizes.productImageRadius),
            color: dark ? MyColors.darkerGrey : MyColors.softGrey,
          ),
        child: Row(
          children: [
            MyRoundedContainer(
              height: 120,
              padding: const EdgeInsets.all(MySizes.sm),
              backgroundColor: dark ? MyColors.dark : MyColors.light,
              child: Stack(
                children: [
                  SizedBox(
                      height: 120,
                      width: 120,
                      child: MyRoundedImage(isNetworkImage: true ,imageUrl: product.thumbnail, applyImageRadius: true,)
                  ),

                  ///sale
                  if(salePercentage != null)
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
                  Positioned(top: 0, right: 0, child: FavouriteIcon(productId: product.id,)),
                ],
              ),
            ),

            ///details
            SizedBox(
              width: 172,
              child: Padding(
                padding: EdgeInsets.only(top: MySizes.sm, left: MySizes.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyProductTitleText(title: product.title, smallSize: true,),
                        SizedBox(height: MySizes.spaceBtwItems/2,),
                        MyBrandTitleWithVerifiedIcon(title: product.brand!.name),
                      ],
                    ),

                    const Spacer(),

                    ///Price row
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
                        InkWell(
                          onTap: (){
                            if(product.productType == ProductType.single.toString()){
                              final cartItem = cartController.convertToCartItem(product, 1);
                              cartController.addOneToCart(cartItem);
                            }else{
                              Get.to(() => ProductDetail(product: product,));
                            }
                          },
                          child: Obx(
                                  (){
                                final productQuantityInCart = cartController.getProductQuantityInCart(product.id);
                                return Container(
                                  decoration: BoxDecoration(
                                    color:productQuantityInCart > 0 ? MyColors.primary : MyColors.dark,
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(MySizes.cardRadiusMd),
                                      bottomRight: Radius.circular(MySizes.productImageRadius),
                                    ),
                                  ),
                                  child: SizedBox(
                                      width: MySizes.iconLg * 1.2,
                                      height: MySizes.iconLg * 1.2,
                                      child: Center(child:productQuantityInCart > 0
                                          ? Text(productQuantityInCart.toString(), style: Theme.of(context).textTheme.bodyLarge!.apply(color: MyColors.white),)
                                          : Icon(Iconsax.add, color: MyColors.white,))),
                                );}
                          ),
                        ),

                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
