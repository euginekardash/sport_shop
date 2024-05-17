import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_shop/common/widgets/appbar/appbar.dart';
import 'package:sport_shop/common/widgets/layouts/grid_layout.dart';
import 'package:sport_shop/common/widgets/products/products_cards/brand_card.dart';
import 'package:sport_shop/common/widgets/products/sortable/sortable_products.dart';
import 'package:sport_shop/common/widgets/texts/section_heading.dart';
import 'package:sport_shop/features/shop/controllers/brand_controller.dart';
import 'package:sport_shop/features/shop/models/brand_model.dart';
import 'package:sport_shop/features/shop/screens/brand/brand_products.dart';
import 'package:sport_shop/utils/constants/sizes.dart';

import '../../../../common/styles/brand_shimmer.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;
    return Scaffold(
      appBar: MyAppBar(title: Text('Бренд'), showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(MySizes.defaultSpace),
          child: Column(
            children: [
              ///heading
              MySectionHeading(title: 'Бренды'),
              const SizedBox(height: MySizes.spaceBtwItems,),

              ///brands
              Obx(
                      (){
                    if(brandController.isLoading.value) return BrandShimmer();

                    if(brandController.allBrands.isEmpty) {
                      return Center(
                        child: Text('No data Found', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),),
                      );
                    }

                    return MyGridLayout(
                      itemCount: brandController.allBrands.length,
                      mainAxisExtent: 80,
                      itemBuilder: (_, index) {
                        final brand = brandController.allBrands[index];

                        return MyBrandCard(showBorder: true, brand: brand, onTap: () => Get.to(() => BrandProducts(brand: brand,)),);
                      },
                    );}
              ),
            ],
          ),
        ),
      ),
    );
  }
}
