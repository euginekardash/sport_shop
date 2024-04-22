import 'package:flutter/material.dart';
import 'package:sport_shop/common/styles/shimmer.dart';
import 'package:sport_shop/utils/constants/sizes.dart';

class HorizontalProductShimmer extends StatelessWidget {
  const HorizontalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: MySizes.spaceBtwSections),
      height: 120,
      child: ListView.separated(
        itemCount: itemCount,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => const SizedBox(width: MySizes.spaceBtwItems,),
          itemBuilder: (_,__) => const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ShimmerEffect(width: 120, height: 120),
              SizedBox(width: MySizes.spaceBtwItems,),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width: MySizes.spaceBtwItems/2,),
                  ShimmerEffect(width: 160, height: 15),
                  SizedBox(width: MySizes.spaceBtwItems/2,),
                  ShimmerEffect(width: 110, height: 15),
                  SizedBox(width: MySizes.spaceBtwItems/2,),
                  ShimmerEffect(width: 80, height: 15),
                  Spacer(),
                ],
              )
            ],
          )
      ),
    );
  }
}
