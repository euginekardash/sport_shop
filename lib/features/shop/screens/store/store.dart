import 'package:flutter/material.dart';
import 'package:sport_shop/common/widgets/appbar/appbar.dart';
import 'package:sport_shop/common/widgets/appbar/tabbar.dart';
import 'package:sport_shop/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:sport_shop/common/widgets/layouts/grid_layout.dart';
import 'package:sport_shop/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:sport_shop/common/widgets/products/products_cards/brand_card.dart';
import 'package:sport_shop/common/widgets/texts/section_heading.dart';
import 'package:sport_shop/features/shop/screens/store/widgets/category_tab.dart';
import 'package:sport_shop/utils/constants/colors.dart';
import 'package:sport_shop/utils/constants/sizes.dart';
import 'package:sport_shop/utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
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
                    MySectionHeading(title: 'Featured Brands', showActionButton: true, onPressed: (){},),
                    const SizedBox(height: MySizes.spaceBtwItems/1.5,),

                    MyGridLayout(itemCount: 4,mainAxisExtent: 80, itemBuilder: (_, index) {
                      return const MyBrandCard(showBorder: false,);
                    })
                  ],
                ),
              ),
              ///Tabs
              bottom: const MyTabBar(
                tabs: [
                  Tab(child: Text('Sports')),
                  Tab(child: Text('Sports')),
                  Tab(child: Text('Sports')),
                  Tab(child: Text('Sports')),
                  Tab(child: Text('Sports')),
                ],
              )

            ),
          ];
        },
            ///body
          body: const TabBarView(
            children: [
              MyCategoryTab(),
              MyCategoryTab(),
              MyCategoryTab(),
              MyCategoryTab(),
              MyCategoryTab(),
            ],
          )
        ),
      ),
    );
  }
}





