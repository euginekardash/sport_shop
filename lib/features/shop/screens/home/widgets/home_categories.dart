import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_shop/common/styles/category_shimmer.dart';
import 'package:sport_shop/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:sport_shop/features/shop/controllers/category_controller.dart';
import 'package:sport_shop/features/shop/screens/sub_category/sub_categories.dart';

class MyHomeCategories extends StatelessWidget {
  const MyHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    return Obx(() {
      if(categoryController.isLoading.value) return const CategoryShimmer();

      if(categoryController.featuredCategories.isEmpty){
        return Center(child: Text('No data found', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),),);
      }
        return SizedBox(
          height: 80,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: categoryController.featuredCategories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              final category = categoryController.featuredCategories[index];
              return MyVerticalmaheText(image: category.image,isNetworkImage: true, title: category.name, onTap: () => Get.to(() => SubCategoriesScreen()),);
            },
          ),
        );
      }
    );
  }
}