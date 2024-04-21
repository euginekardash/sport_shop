import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sport_shop/common/widgets/appbar/appbar.dart';
import 'package:sport_shop/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:sport_shop/common/widgets/icons/circular_icon.dart';
import 'package:sport_shop/common/widgets/images/rounded_image.dart';
import 'package:sport_shop/common/widgets/products/favourite_icon/favourite_icon.dart';
import 'package:sport_shop/features/shop/controllers/images_controller.dart';
import 'package:sport_shop/features/shop/models/product_model.dart';
import 'package:sport_shop/utils/constants/colors.dart';
import 'package:sport_shop/utils/constants/image_strings.dart';
import 'package:sport_shop/utils/constants/sizes.dart';
import 'package:sport_shop/utils/helpers/helper_functions.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key, required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    
    final controller = Get.put(ImagesController());
    final images = controller.getAllProductImages(product);
    
    return MyCurvedEdgeWidget(
      child: Container(
        color: dark? MyColors.darkerGrey : MyColors.light,
        child: Stack(
          children: [
            ///Main large image
            SizedBox(height:400, child: Padding(
              padding: EdgeInsets.all(MySizes.productImageRadius*2),
              child: Center(child: Obx((){
                final image = controller.selectedProductImage.value;
                return GestureDetector(
                  onTap: () => controller.showEnlargedImage(image),
                  child: CachedNetworkImage(
                    imageUrl: image, 
                    progressIndicatorBuilder: (_,__, downloadProgress) => 
                      CircularProgressIndicator(value: downloadProgress.progress, color: MyColors.primary,),),
                );} 
                )
              ),
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
                  itemCount: images.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (_, index) => Obx(
                    (){
                      final imageSelected = controller.selectedProductImage.value == images[index];
                      return MyRoundedImage(
                      width: 80,
                      isNetworkImage: true,
                      onPressed: () => controller.selectedProductImage.value = images[index],
                      backgroundColor: dark ? MyColors.dark : MyColors.white,
                      border: Border.all(color: imageSelected ? MyColors.primary : Colors.transparent),
                      padding: const EdgeInsets.all(MySizes.sm),
                      imageUrl: images[index],
                    );
                    } 
                  ),
                ),
              ),
            ),
            ///Appbar Icons
            MyAppBar(
              showBackArrow: true,
              actions: [
                FavouriteIcon(productId: product.id,),
              ],
            )

          ],
        ),
      ),
    );
  }
}