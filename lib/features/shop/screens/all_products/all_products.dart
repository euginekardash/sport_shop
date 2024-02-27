import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sport_shop/common/widgets/appbar/appbar.dart';
import 'package:sport_shop/common/widgets/layouts/grid_layout.dart';
import 'package:sport_shop/common/widgets/products/products_cards/product_card_vertical.dart';
import 'package:sport_shop/common/widgets/products/sortable/sortable_products.dart';
import 'package:sport_shop/utils/constants/sizes.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: Text('Popular Products'), showBackArrow: true,),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(MySizes.defaultSpace),
        child: SortableProducts(),
      ),
    );
  }
}


