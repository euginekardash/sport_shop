import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_shop/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:sport_shop/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:sport_shop/common/widgets/layouts/grid_layout.dart';
import 'package:sport_shop/common/widgets/products/products_cards/product_card_vertical.dart';
import 'package:sport_shop/common/widgets/texts/section_heading.dart';
import 'package:sport_shop/features/shop/screens/all_products/all_products.dart';
import 'package:sport_shop/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:sport_shop/features/shop/screens/home/widgets/home_categories.dart';
import 'package:sport_shop/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:sport_shop/utils/constants/sizes.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(  
          children: [
            ///Header
            const MyPrimaryHeaderContainer(
              child: Column(
                children: [
                  ///appbar
                  MyHomeAppBar(),
                  SizedBox(height: MySizes.spaceBtwSections,),

                  ///searchbar
                  MySearchContainer(text: 'Search in store',),
                  SizedBox(height: MySizes.spaceBtwSections,),


                  Padding(
                    padding: EdgeInsets.only(left: MySizes.defaultSpace),
                  child: Column(
                    children: [
                      ///Heading
                      MySectionHeading(title: 'Popular Categories', showActionButton: false, textColor: Colors.white,),
                      SizedBox(height: MySizes.spaceBtwItems,),

                      ///Categories
                      MyHomeCategories(),
                    ],
                  ),
                  ),
                  SizedBox(height: MySizes.spaceBtwSections,),
                ],
              )
            ),

            ///Body
            Padding(
              padding: const EdgeInsets.all(MySizes.defaultSpace),
              child: Column(
                children: [
                  const MyPromoSlider(),
                  const SizedBox(height: MySizes.spaceBtwSections,),

                  ///Heading
                  MySectionHeading(title: 'Popular Products', onPressed: () => Get.to(() => const AllProducts()), showActionButton: true,),
                  const SizedBox(height: MySizes.spaceBtwItems,),

                  ///Popular Products
                  MyGridLayout(itemCount: 2, itemBuilder: (_, index) => const ProductCardVertical(),),
                ]
              ),
            ),
          ],
        ),
      )
    );
  }
}






















