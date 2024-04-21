import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sport_shop/common/styles/vertical_product_shimmer.dart';
import 'package:sport_shop/common/widgets/brands/brand_show_case.dart';
import 'package:sport_shop/common/widgets/layouts/grid_layout.dart';
import 'package:sport_shop/common/widgets/products/products_cards/product_card_vertical.dart';
import 'package:sport_shop/common/widgets/texts/section_heading.dart';
import 'package:sport_shop/features/shop/controllers/category_controller.dart';
import 'package:sport_shop/features/shop/models/category_model.dart';
import 'package:sport_shop/features/shop/models/product_model.dart';
import 'package:sport_shop/features/shop/screens/all_products/all_products.dart';
import 'package:sport_shop/features/shop/screens/store/widgets/category_brands.dart';
import 'package:sport_shop/utils/constants/sizes.dart';
import 'package:sport_shop/utils/helpers/cloud_helper_functions.dart';

class MyCategoryTab extends StatelessWidget {
  const MyCategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(MySizes.defaultSpace),
          child: Column(
            children: [
              ///brands
              CategoryBrands(category: category),
              const SizedBox(height: MySizes.spaceBtwItems,),

              ///products
              FutureBuilder(
                future: controller.getCategoryProducts(categoryId: category.id),
                builder: (context, snapshot) {

                  final response = CloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: const VerticalProductShimmer());
                  if (response != null) return response;

                  final products = snapshot.data!;

                  return Column(
                    children: [
                      MySectionHeading(title: 'Вам может понравится', showActionButton: true, onPressed: () => Get.to(AllProducts(
                        title: category.name,
                        futureMethod: controller.getCategoryProducts(categoryId: category.id, limit: -1),
                        )),
                      ),
                      const SizedBox(height: MySizes.spaceBtwItems,),

                      MyGridLayout(itemCount: products.length, itemBuilder: (_, index) => ProductCardVertical(product: products[index],)),
                    ],
                  );
                }
              ),

            ],
          ),
        ),
      ]
    );
  }
}
