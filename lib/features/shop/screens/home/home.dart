import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sport_shop/common/widgets/appbar/appbar.dart';
import 'package:sport_shop/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:sport_shop/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:sport_shop/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:sport_shop/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:sport_shop/common/widgets/texts/section_heading.dart';
import 'package:sport_shop/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:sport_shop/features/shop/screens/home/widgets/home_categories.dart';
import 'package:sport_shop/utils/constants/colors.dart';
import 'package:sport_shop/utils/constants/sizes.dart';
import 'package:sport_shop/utils/device/device_utility.dart';
import 'package:sport_shop/utils/helpers/helper_functions.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: SingleChildScrollView(
        child: Column(  
          children: [
            MyPrimaryHeaderContainer(
              child: Column(
                children: [
                  MyHomeAppBar(),
                  SizedBox(height: MySizes.spaceBtwSections,),
                  
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
          ],
        ),
      )
    );
  }
}
















