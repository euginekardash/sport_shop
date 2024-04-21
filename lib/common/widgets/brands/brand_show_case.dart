import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sport_shop/common/styles/shimmer.dart';
import 'package:sport_shop/common/widgets/containers/rounded_container.dart';
import 'package:sport_shop/common/widgets/products/products_cards/brand_card.dart';
import 'package:sport_shop/features/shop/models/brand_model.dart';
import 'package:sport_shop/features/shop/screens/brand/brand_products.dart';
import 'package:sport_shop/utils/constants/colors.dart';
import 'package:sport_shop/utils/constants/sizes.dart';
import 'package:sport_shop/utils/helpers/helper_functions.dart';

class MyBrandShowcase extends StatelessWidget {
  const MyBrandShowcase({
    super.key, required this.images, required this.brand,
  });

  final BrandModel brand;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => BrandProducts(brand: brand,)),
      child: MyRoundedContainer(
        showBorder: true,
        borderColor: MyColors.darkGrey,
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(MySizes.sm),
        margin: const EdgeInsets.only(bottom: MySizes.spaceBtwItems),
        child: Column(
          children: [
            MyBrandCard(showBorder: false, brand: brand),
            const SizedBox(height: MySizes.spaceBtwItems,),
      
            Row(
              children: images.map((image) => brandTopProductImageWidget(image, context)).toList(),
            )
          ],
        ),
      ),
    );
  }
  Widget brandTopProductImageWidget(String image, context){
    return Expanded(child: MyRoundedContainer(
      height: 100,
      padding: const EdgeInsets.all(MySizes.md),
      margin: const EdgeInsets.only(right: MySizes.sm),
      backgroundColor: MyHelperFunctions.isDarkMode(context) ? MyColors.darkerGrey : MyColors.light,
      child: CachedNetworkImage(
        fit: BoxFit.contain,
        imageUrl: image,
        progressIndicatorBuilder: (context, url, downloadProgress) => const ShimmerEffect(width: 100, height: 100),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      )
    ),
    );
  }
}