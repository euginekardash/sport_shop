import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sport_shop/common/widgets/appbar/appbar.dart';
import 'package:sport_shop/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:sport_shop/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:sport_shop/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:sport_shop/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:sport_shop/common/widgets/images/rounded_image.dart';
import 'package:sport_shop/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:sport_shop/common/widgets/texts/section_heading.dart';
import 'package:sport_shop/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:sport_shop/features/shop/screens/home/widgets/home_categories.dart';
import 'package:sport_shop/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:sport_shop/utils/constants/colors.dart';
import 'package:sport_shop/utils/constants/sizes.dart';
import 'package:sport_shop/utils/device/device_utility.dart';
import 'package:sport_shop/utils/helpers/helper_functions.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(  
          children: [
            ///Header
            MyPrimaryHeaderContainer(
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
                  )
                ],
              )
            ),

            ///Body
            Padding(
              padding: EdgeInsets.all(MySizes.defaultSpace),
              child: MyPromoSlider(banners: ["assets/images/banners/promo-banner-1.png", "assets/images/banners/promo-banner-2.png", "assets/images/banners/promo-banner-3.png"],)
            ),

            ///Popular Products

          ],
        ),
      )
    );
  }
}




















