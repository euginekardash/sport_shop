import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_shop/common/widgets/appbar/appbar.dart';
import 'package:sport_shop/common/widgets/layouts/grid_layout.dart';
import 'package:sport_shop/common/widgets/products/products_cards/brand_card.dart';
import 'package:sport_shop/common/widgets/products/sortable/sortable_products.dart';
import 'package:sport_shop/common/widgets/texts/section_heading.dart';
import 'package:sport_shop/features/shop/screens/brand/brand_products.dart';
import 'package:sport_shop/utils/constants/sizes.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: Text('Brand'), showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(MySizes.defaultSpace),
          child: Column(
            children: [
              ///heading
              MySectionHeading(title: 'Brands'),
              const SizedBox(height: MySizes.spaceBtwItems,),

              ///brands
              MyGridLayout(itemCount: 10,mainAxisExtent: 80, itemBuilder: (context, index) => MyBrandCard(showBorder: true, onTap: () => Get.to(() => BrandProducts()),)),
            ],
          ),
        ),
      ),
    );
  }
}
