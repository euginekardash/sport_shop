import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_shop/common/widgets/appbar/appbar.dart';
import 'package:sport_shop/common/widgets/images/rounded_image.dart';
import 'package:sport_shop/common/widgets/products/products_cards/product_card_horizontal.dart';
import 'package:sport_shop/common/widgets/texts/section_heading.dart';
import 'package:sport_shop/features/shop/controllers/category_controller.dart';
import 'package:sport_shop/features/shop/models/category_model.dart';
import 'package:sport_shop/features/shop/screens/all_products/all_products.dart';
import 'package:sport_shop/utils/constants/sizes.dart';
import 'package:sport_shop/utils/helpers/cloud_helper_functions.dart';

import '../../../../common/styles/horizontal_product_shimmer.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return Scaffold(
      appBar: MyAppBar(title: Text(category.name), showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(MySizes.defaultSpace),
          child: Column(
            children: [
              ///Banner
              MyRoundedImage(imageUrl: 'assets/images/banners/promo-banner-1.png', width: double.infinity, applyImageRadius: true,),
              const SizedBox(height: MySizes.spaceBtwSections,),

              ///sub
              FutureBuilder(
                future: controller.getSubCategories(category.id),
                builder: (context, snapshot) {

                  const loader = HorizontalProductShimmer();
                  final widget = CloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                  if(widget != null) return widget;

                  final subCategories = snapshot.data!;

                  return ListView.builder(
                    shrinkWrap: true,
                      itemCount: subCategories.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (_, index){

                      final subCategory = subCategories[index];
                        return FutureBuilder(
                          future: controller.getCategoryProducts(categoryId: subCategory.id),
                          builder: (context, snapshot) {

                            final widget = CloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                            if(widget != null) return widget;

                            final products = snapshot.data!;

                            return Column(
                              children: [
                                MySectionHeading(title: subCategory.name, showActionButton: true, onPressed: () => Get.to(
                                    () => AllProducts(
                                      title: subCategory.name,
                                      futureMethod: controller.getCategoryProducts(categoryId: subCategory.id, limit: -1),
                                    )
                                ),),
                                const SizedBox(height: MySizes.spaceBtwItems/2,),

                                SizedBox(
                                  height: 120,
                                  child: ListView.separated(
                                      itemCount: products.length,
                                      scrollDirection:Axis.horizontal,
                                      separatorBuilder: (context, index) => const SizedBox(width: MySizes.spaceBtwItems,),
                                      itemBuilder: (context, index) => ProductCardHorizontal(product: products[index])
                                  ),
                                ),
                                const SizedBox(height: MySizes.spaceBtwSections,),
                              ],
                            );
                          }
                        );
                      },
                  );
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}
