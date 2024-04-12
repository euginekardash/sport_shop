import 'package:flutter/cupertino.dart';
import 'package:sport_shop/common/styles/shimmer.dart';
import 'package:sport_shop/common/widgets/layouts/grid_layout.dart';
import 'package:sport_shop/utils/constants/sizes.dart';

class VerticalProductShimmer extends StatelessWidget{
  const VerticalProductShimmer({
    super.key,
    this.itemCount = 4,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context){
    return MyGridLayout(
        itemCount: itemCount,
        itemBuilder: (_, __) => const SizedBox(
          width: 180,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerEffect(width: 180, height: 180),
              SizedBox(height: MySizes.spaceBtwItems,),

              ShimmerEffect(width: 160, height: 15),
              SizedBox(height: MySizes.spaceBtwItems/2,),
              ShimmerEffect(width: 118, height: 15),
            ],
          ),
        )
    );
  }
}