import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_shop/common/widgets/appbar/appbar.dart';
import 'package:sport_shop/common/widgets/appbar/tabbar.dart';
import 'package:sport_shop/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:sport_shop/common/widgets/layouts/grid_layout.dart';
import 'package:sport_shop/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:sport_shop/common/widgets/products/products_cards/brand_card.dart';
import 'package:sport_shop/common/widgets/texts/section_heading.dart';
import 'package:sport_shop/features/shop/controllers/brand_controller.dart';
import 'package:sport_shop/features/shop/controllers/category_controller.dart';
import 'package:sport_shop/features/shop/screens/brand/all_brands.dart';
import 'package:sport_shop/features/shop/screens/brand/brand_products.dart';
import 'package:sport_shop/features/shop/screens/store/widgets/category_tab.dart';
import 'package:sport_shop/utils/constants/colors.dart';
import 'package:sport_shop/utils/constants/sizes.dart';
import 'package:sport_shop/utils/helpers/helper_functions.dart';

import '../../../../common/styles/brand_shimmer.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = Get.put(BrandController());
    final categories = CategoryController.instance.featuredCategories;
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: MyAppBar(
          title: const Text('Store'),
          actions: [
            MyCartCounterIcon(onPressed: (){},),
          ],
        ),
        body: NestedScrollView(headerSliverBuilder: (_, innerBoxisScrolled) {
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              floating: true,
              backgroundColor: MyHelperFunctions.isDarkMode(context) ? MyColors.black : MyColors.white,
              expandedHeight: 440,

              flexibleSpace: Padding(
                padding: const EdgeInsets.all(MySizes.defaultSpace),
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    ///search bar
                    const SizedBox(height: MySizes.spaceBtwItems,),
                    const MySearchContainer(text: 'Search in store', showBorder: true, showBackground: false, padding: EdgeInsets.zero,),
                    const SizedBox(height: MySizes.spaceBtwSections,),

                    ///featured brands
                    MySectionHeading(title: 'Featured Brands', showActionButton: true, onPressed: () => Get.to(() => const AllBrandsScreen()),),
                    const SizedBox(height: MySizes.spaceBtwItems/1.5,),

                    Obx(
                      (){
                        if(brandController.isLoading.value) return BrandShimmer();

                        if(brandController.featuredBrands.isEmpty) {
                          return Center(
                            child: Text('No data Found', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),),
                          );
                        }

                        return MyGridLayout(
                        itemCount: brandController.featuredBrands.length,
                        mainAxisExtent: 80,
                        itemBuilder: (_, index) {
                          final brand = brandController.featuredBrands[index];
                          return MyBrandCard(showBorder: true, brand: brand, onTap: () => Get.to(() => BrandProducts(brand: brand)),);
                        },
                      );}
                    ),
                  ],
                ),
              ),
              ///Tabs
              bottom: MyTabBar(tabs: categories.map((category) => Tab(child: Text(category.name))).toList()),
              )


          ];
        },
            ///body
          body: TabBarView(
            children: categories.map((category) => MyCategoryTab(category: category,)).toList()
          )
        ),
      ),
    );
  }
}





