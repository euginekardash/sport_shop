import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_shop/common/styles/vertical_product_shimmer.dart';
import 'package:sport_shop/common/widgets/appbar/appbar.dart';
import 'package:sport_shop/common/widgets/products/products_cards/brand_card.dart';
import 'package:sport_shop/common/widgets/products/sortable/sortable_products.dart';
import 'package:sport_shop/features/shop/controllers/brand_controller.dart';
import 'package:sport_shop/features/shop/models/brand_model.dart';
import 'package:sport_shop/utils/constants/sizes.dart';
import 'package:sport_shop/utils/helpers/cloud_helper_functions.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: MyAppBar(title: Text(brand.name),),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(MySizes.defaultSpace),
          child: Column(
            children: [
              MyBrandCard(showBorder: true, brand: brand,),
              SizedBox(height: MySizes.spaceBtwSections,),

              FutureBuilder(
                future: controller.getBrandProducts(brandId: brand.id),
                builder: (context, snapshot) {

                  const loader = VerticalProductShimmer();
                  final widget = CloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                  if(widget != null ) return widget;

                  final brandProducts = snapshot.data!;
                  return SortableProducts(products: brandProducts,);
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
