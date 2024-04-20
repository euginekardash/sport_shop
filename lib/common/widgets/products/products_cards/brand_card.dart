import 'package:flutter/material.dart';
import 'package:sport_shop/common/widgets/containers/rounded_container.dart';
import 'package:sport_shop/common/widgets/images/circular_image.dart';
import 'package:sport_shop/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:sport_shop/features/shop/models/brand_model.dart';
import 'package:sport_shop/utils/constants/colors.dart';
import 'package:sport_shop/utils/constants/enums.dart';
import 'package:sport_shop/utils/constants/sizes.dart';
import 'package:sport_shop/utils/helpers/helper_functions.dart';

class MyBrandCard extends StatelessWidget {
  const MyBrandCard({
    super.key,
    required this.showBorder,
    this.onTap, required this.brand,
  });

  final BrandModel brand;
  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector( // это отдельным виджетом MyBrandCard
      onTap: onTap,
      child: MyRoundedContainer(
        padding: const EdgeInsets.all(MySizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            ///Icon
            Flexible(
              child: MyCircularImage(
                isNetworkImage: true,
                image: brand.image,
                backgroundColor: Colors.transparent,
                overlayColor: MyHelperFunctions.isDarkMode(context) ? MyColors.white : MyColors.black,
              ),
            ),
            const SizedBox(width: MySizes.spaceBtwItems/2,),

            ///Text
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyBrandTitleWithVerifiedIcon(title: brand.name, brandTextSize: TextSizes.large),
                  Text(
                    '${brand.productsCount ?? 0} products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}