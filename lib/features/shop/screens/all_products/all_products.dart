import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:sport_shop/common/styles/vertical_product_shimmer.dart';
import 'package:sport_shop/common/widgets/appbar/appbar.dart';
import 'package:sport_shop/common/widgets/products/sortable/sortable_products.dart';
import 'package:sport_shop/utils/constants/sizes.dart';
import 'package:sport_shop/utils/helpers/cloud_helper_functions.dart';

import '../../controllers/all_product_controller.dart';
import '../../models/product_model.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key, required this.title, this.query, this.futureMethod});

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    return Scaffold(
      appBar: MyAppBar(title: Text(title), showBackArrow: true,),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(MySizes.defaultSpace),
        child: FutureBuilder(
          future: futureMethod ?? controller.fetchProductsByQuery(query),
          builder: (context, snapshot) {

            const loader = VerticalProductShimmer();
            final widget = CloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);

            if(widget != null) return widget;

            final products = snapshot.data!;

            return SortableProducts(products: products,);
          }
        ),
      ),
    );
  }
}


