import 'package:flutter/material.dart';
import 'package:sport_shop/common/widgets/images/circular_image.dart';
import 'package:sport_shop/utils/constants/colors.dart';
import 'package:sport_shop/utils/constants/sizes.dart';
import 'package:sport_shop/utils/helpers/helper_functions.dart';

class MyVerticalmaheText extends StatelessWidget {
  const MyVerticalmaheText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = MyColors.white,
    this.backgroundColor = MyColors.white,
    this.onTap,
    this.isNetworkImage = true,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final bool isNetworkImage;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: MySizes.spaceBtwItems),
        child: Column(
          children: [
            // Container(
            //   width: 56,
            //   height: 56,
            //   padding: const EdgeInsets.all(MySizes.sm),
            //   decoration: BoxDecoration(
            //       color: backgroundColor ?? (dark ? MyColors.black : MyColors.white),
            //       borderRadius: BorderRadius.circular(100)
            //   ),
            //   child: Center(
            //     child: Image(image: AssetImage(image), fit: BoxFit.cover, color: MyColors.dark,),
            //   ),
            // ),
            MyCircularImage(image: image, fit: BoxFit.fitWidth,
              padding: MySizes.sm *1.4,
              isNetworkImage: isNetworkImage,
              backgroundColor: backgroundColor,
              overlayColor: MyHelperFunctions.isDarkMode(context)? MyColors.light : MyColors.dark,
            ),
            ///Text
            const SizedBox(height: MySizes.spaceBtwItems/2,),
            SizedBox(
                width: 55,
                child: Text(title, style: Theme.of(context).textTheme.labelMedium!.apply(color: textColor), maxLines: 1, overflow: TextOverflow.ellipsis,
                )
            )
          ],
        ),
      ),
    );
  }
}