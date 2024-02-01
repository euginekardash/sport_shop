import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sport_shop/common/widgets/texts/brand_title_text.dart';
import 'package:sport_shop/utils/constants/colors.dart';
import 'package:sport_shop/utils/constants/enums.dart';
import 'package:sport_shop/utils/constants/sizes.dart';

class MyBrandTitleWithVerifiedIcon extends StatelessWidget {
  const MyBrandTitleWithVerifiedIcon({
    super.key, 
    required this.title, 
    this.maxLines = 1, 
    this.textColor, 
    this.iconColor = MyColors.primary, 
    this.textAlign = TextAlign.center, 
    this.brandTextSize = TextSizes.small,
  });
  
  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(child: MyBrandTitleText(
          title: title,
          color: textColor,
          maxLines: maxLines,
          textAlign: textAlign,
          brandTextSizes: brandTextSize,
        )),
        const SizedBox(width: MySizes.xs,),
        const Icon(Iconsax.verify5, color: MyColors.primary, size: MySizes.iconXs,),
      ],
    );
  }
}