import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/shop/controllers/product/favourites_controller.dart';
import '../../../../utils/constants/colors.dart';
import '../../icons/circular_icon.dart';

class FavouriteIcon extends StatelessWidget {
  const FavouriteIcon({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouritesController());
    return Obx(() => CircularIcon(
      icon: controller.isFavourite(productId) ? Iconsax.heart5 : Iconsax.heart,
      color: controller.isFavourite(productId) ? MyColors.error : null,
      onPressed: () => controller.toggleFavoriteProduct(productId),
    ));
  }
}
