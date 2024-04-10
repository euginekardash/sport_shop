import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_shop/common/styles/shimmer.dart';
import 'package:sport_shop/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:sport_shop/common/widgets/images/rounded_image.dart';
import 'package:sport_shop/features/shop/controllers/banner_controller.dart';
import 'package:sport_shop/features/shop/controllers/home_controller.dart';
import 'package:sport_shop/utils/constants/colors.dart';
import 'package:sport_shop/utils/constants/sizes.dart';

class MyPromoSlider extends StatelessWidget {
  const MyPromoSlider({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(
      (){

        if(controller.isLoading.value) return const ShimmerEffect(width: double.infinity, height: 190);

        if(controller.banners.isEmpty){
          return const Center(child: Text('No Data found'),);
        } else {
          return Column(
            children: [
              CarouselSlider(
                  options: CarouselOptions(
                    viewportFraction : 1,
                    onPageChanged: (index, _) => controller.updatePageIndicator(index),
                  ),
                  items: controller.banners.map((banner) => MyRoundedImage(imageUrl: banner.imageUrl, isNetworkImage: false,onPressed: () => Get.toNamed(banner.targetScreen),)).toList()
              ),
              const SizedBox(height: MySizes.spaceBtwItems,),
              Center(
                child: Obx(
                      () => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for(int i = 0; i < controller.banners.length; i++)
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
    );
  }
}