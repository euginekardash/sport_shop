import 'package:flutter/material.dart';
import 'package:sport_shop/common/styles/shimmer.dart';
import 'package:sport_shop/utils/constants/sizes.dart';

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
          separatorBuilder: (_, __) => const SizedBox(width: MySizes.spaceBtwItems,),
          itemCount: itemCount,
        itemBuilder: (_, __){
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerEffect(width: 55, height: 55, radius: 55,),
              SizedBox(height: MySizes.spaceBtwItems/2,),

              ShimmerEffect(width: 55, height: 8),
            ],
          );
        },
      ),

    );
  }
}
