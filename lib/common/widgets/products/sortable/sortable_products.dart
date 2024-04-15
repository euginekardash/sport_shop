import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sport_shop/common/widgets/layouts/grid_layout.dart';
import 'package:sport_shop/common/widgets/products/products_cards/product_card_vertical.dart';
import 'package:sport_shop/features/shop/controllers/all_product_controller.dart';
import 'package:sport_shop/features/shop/models/product_model.dart';
import 'package:sport_shop/utils/constants/sizes.dart';

class SortableProducts extends StatelessWidget {
  const SortableProducts({
    super.key, required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    controller.assignProducts(products);
    return Column(
      children: [
        DropdownButtonFormField(
            decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
            value: controller.selectedSortOption.value,
            items: ['Name', 'Higher price', 'Lower price', 'Sale', 'Newest', 'Popularity'
            ].map((option) => DropdownMenuItem(value: option, child: Text(option))).toList(),
            onChanged: (value){
              controller.sortProducts(value!);
            }
        ),
        const SizedBox(height: MySizes.spaceBtwSections,),

        Obx(() =>  MyGridLayout(itemCount: controller.products.length, itemBuilder: (_, index) => ProductCardVertical(product: controller.products[index],))),
      ],
    );
  }
}