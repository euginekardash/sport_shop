import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sport_shop/common/widgets/appbar/appbar.dart';
import 'package:sport_shop/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:sport_shop/common/widgets/icons/circular_icon.dart';
import 'package:sport_shop/common/widgets/images/rounded_image.dart';
import 'package:sport_shop/utils/constants/colors.dart';
import 'package:sport_shop/utils/constants/image_strings.dart';
import 'package:sport_shop/utils/constants/sizes.dart';
import 'package:sport_shop/utils/helpers/helper_functions.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    return MyCurvedEdgeWidget(
      child: Container(
        color: dark? MyColors.darkerGrey : MyColors.light,
        child: Stack(
          children: [
            ///Main large image
             const SizedBox(height:400, child: Padding(
              padding: EdgeInsets.all(MySizes.productImageRadius*2),
              child: Center(child: Image(image: AssetImage(MyImages.productImage1))),
            )
            ),

            ///image slider
            Positioned(
              right: 0,
              bottom: 30,
              left: MySizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  separatorBuilder: (_, __) => const SizedBox(width: MySizes.spaceBtwItems,),
                  itemCount: 6,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (_, index) => MyRoundedImage(
                      width: 80,
                      backgroundColor: dark ? MyColors.dark : MyColors.white,
                      border: Border.all(color: MyColors.primary),
                      padding: const EdgeInsets.all(MySizes.sm),
                      imageUrl: MyImages.productImage2
                  ),
                ),
              ),
            ),
            ///Appbar Icons
            const MyAppBar(
              showBackArrow: true,
              actions: [
                CircularIcon(icon: Iconsax.heart5, color: Colors.red,)
              ],
            )

          ],
        ),
      ),
    );
  }
}