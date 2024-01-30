import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_shop/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:sport_shop/common/widgets/images/rounded_image.dart';
import 'package:sport_shop/features/shop/controllers/home_controller.dart';
import 'package:sport_shop/utils/constants/colors.dart';
import 'package:sport_shop/utils/constants/sizes.dart';

class MyPromoSlider extends StatelessWidget {
  const MyPromoSlider({
    super.key,
    required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction : 1,
            onPageChanged: (index, _) => controller.updatePageIndicator(index),
          ),
          items: banners.map((url) => MyRoundedImage(imageUrl: url)).toList()
        ),
        const SizedBox(height: MySizes.spaceBtwItems,),
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for(int i = 0; i < banners.length; i++)
                  MyCircularContainer(
                    width: 20,
                    height: 4,
                    backgroundColor: controller.carouselCurrentIndex.value == i ? MyColors.primary : MyColors.grey,
                    margin: const EdgeInsets.only(right: 10),
                  ),
              ],
            ),
          ),
        )
      ],
    );
  }
}