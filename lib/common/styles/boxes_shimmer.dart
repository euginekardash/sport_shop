import 'package:flutter/material.dart';
import 'package:sport_shop/common/styles/shimmer.dart';
import 'package:sport_shop/utils/constants/sizes.dart';

class BoxesShimmer extends StatelessWidget {
  const BoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(child: ShimmerEffect(width: 150, height: 110)),
            SizedBox(width: MySizes.spaceBtwItems,),
            Expanded(child: ShimmerEffect(width: 150, height: 110)),
            SizedBox(width: MySizes.spaceBtwItems,),
            Expanded(child: ShimmerEffect(width: 150, height: 110)),
          ],
        )
      ],
    );
  }
}
