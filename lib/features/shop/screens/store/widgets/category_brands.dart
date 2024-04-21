import 'package:flutter/material.dart';
import 'package:sport_shop/common/widgets/brands/brand_show_case.dart';
import 'package:sport_shop/features/shop/controllers/brand_controller.dart';
import 'package:sport_shop/features/shop/models/category_model.dart';
import 'package:sport_shop/utils/constants/sizes.dart';
import 'package:sport_shop/utils/helpers/cloud_helper_functions.dart';

import '../../../../../common/styles/boxes_shimmer.dart';
import '../../../../../common/styles/list_tile_shimmer.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({super.key, required this.category});
  
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
      future: controller.getBrandsForCategory(category.id),
      builder: (context, snapshot) {

        const loader = Column(
          children: [
            ListTileShimmer(),
            SizedBox(height: MySizes.spaceBtwItems,),
            BoxesShimmer(),
            SizedBox(height: MySizes.spaceBtwItems,),
          ],
        );

        final widget = CloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
        if(widget != null) return widget;

        final brands = snapshot.data!;

        return ListView.builder(
          shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: brands.length,
            itemBuilder: (_, index){
              final brand = brands[index];

              return FutureBuilder(
                future: controller.getBrandProducts(brandId:brand.id, limit: 3),
                builder: (context, snapshot) {

                  final widget = CloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                  if(widget != null) return widget;

                  final products = snapshot.data!;

                  return MyBrandShowcase(brand: brand,images: products.map((e) => e.thumbnail).toList());
                }
              );
            }
        );
      }
    );
  }
}
