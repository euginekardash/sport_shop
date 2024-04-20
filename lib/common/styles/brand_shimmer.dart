import 'package:flutter/material.dart';
import 'package:sport_shop/common/styles/shimmer.dart';
import 'package:sport_shop/common/widgets/layouts/grid_layout.dart';

class BrandShimmer extends StatelessWidget {
  const BrandShimmer({super.key,  this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return MyGridLayout(itemCount: itemCount, mainAxisExtent: 80, itemBuilder: (_,__) => const ShimmerEffect(width: 300, height: 80));
  }
}
