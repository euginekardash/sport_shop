import 'package:flutter/material.dart';
import 'package:sport_shop/common/widgets/appbar/appbar.dart';
import 'package:sport_shop/common/widgets/products/products_cards/brand_card.dart';
import 'package:sport_shop/common/widgets/products/sortable/sortable_products.dart';
import 'package:sport_shop/utils/constants/sizes.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: Text('Nike'),),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(MySizes.defaultSpace),
          child: Column(
            children: [
              MyBrandCard(showBorder: true),
              SizedBox(height: MySizes.spaceBtwSections,),

              SortableProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
