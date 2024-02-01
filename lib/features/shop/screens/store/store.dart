import 'package:flutter/material.dart';
import 'package:sport_shop/common/widgets/appbar/appbar.dart';
import 'package:sport_shop/common/widgets/containers/rounded_container.dart';
import 'package:sport_shop/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:sport_shop/common/widgets/images/circular_image.dart';
import 'package:sport_shop/common/widgets/layouts/grid_layout.dart';
import 'package:sport_shop/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:sport_shop/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:sport_shop/common/widgets/texts/section_heading.dart';
import 'package:sport_shop/utils/constants/colors.dart';
import 'package:sport_shop/utils/constants/enums.dart';
import 'package:sport_shop/utils/constants/image_strings.dart';
import 'package:sport_shop/utils/constants/sizes.dart';
import 'package:sport_shop/utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: Text('Store'),
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
              padding: EdgeInsets.all(MySizes.defaultSpace),
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
                    return GestureDetector(
                      onTap: (){},
                      child: MyRoundedContainer(
                        padding: const EdgeInsets.all(MySizes.sm),
                        showBorder: true,
                        backgroundColor: Colors.transparent,
                        child: Row(
                          children: [
                            ///Icon
                            Flexible(
                              child: MyCircularImage(
                                isNetworkImage: false,
                                image: "assets/icons/categories/icons8-school-uniform-64.png",
                                backgroundColor: Colors.transparent,
                                overlayColor: MyHelperFunctions.isDarkMode(context) ? MyColors.white : MyColors.black,
                              ),
                            ),
                            const SizedBox(width: MySizes.spaceBtwItems/2,),

                            ///Text
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const MyBrandTitleWithVerifiedIcon(title: 'Nike', brandTextSize: TextSizes.large),
                                  Text(
                                    '256 products',
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context).textTheme.labelMedium,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  })
                ],
              ),
            ),
          ),
        ];
      },body: Container(),),
    );
  }
}

