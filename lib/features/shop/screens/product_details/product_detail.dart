import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:sport_shop/common/widgets/appbar/appbar.dart';
import 'package:sport_shop/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:sport_shop/common/widgets/icons/circular_icon.dart';
import 'package:sport_shop/common/widgets/images/rounded_image.dart';
import 'package:sport_shop/common/widgets/texts/section_heading.dart';
import 'package:sport_shop/features/shop/models/product_model.dart';
import 'package:sport_shop/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:sport_shop/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:sport_shop/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:sport_shop/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:sport_shop/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:sport_shop/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:sport_shop/utils/constants/colors.dart';
import 'package:sport_shop/utils/constants/image_strings.dart';
import 'package:sport_shop/utils/constants/sizes.dart';
import 'package:sport_shop/utils/helpers/helper_functions.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key,required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: BottomAddToCart(),
     body: SingleChildScrollView(
       child: Column(
         children: [
         ///product image slider
         ProductImageSlider(),

         ///product details
         Padding(
             padding: EdgeInsets.only(right: MySizes.defaultSpace, left: MySizes.defaultSpace, bottom: MySizes.defaultSpace),
           child: Column(
             children: [
               ///Rating, share
               RatingAndShare(),

               ///price, title, stack, brand
               ProductMetaData(),

               ///attributes
               ProductAttributes(),
               const SizedBox(height: MySizes.spaceBtwSections,),

               ///checkout button
               SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child: Text('Checkout'))),
               const SizedBox(height: MySizes.spaceBtwSections,),

               ///description
               const MySectionHeading(title: 'Description'),
               const SizedBox(height: MySizes.spaceBtwItems,),
               const ReadMoreText(
                 'A football is a ball inflated with air that is used to play one of the various sports known as football. In these games, with some exceptions, goals or points are scored only when the ball enters one of two designated goal-scoring areas; football games involve the two teams each trying to move the ball in opposite directions along the field of play.',
                 trimLines: 2,
                 trimMode: TrimMode.Line,
                 trimCollapsedText: ' Show more',
                 trimExpandedText: ' Less',
                 moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                 lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
               ),

               ///reviews
               const Divider(),
               const SizedBox(height: MySizes.spaceBtwItems,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   const MySectionHeading(title: 'Reviews(199)'),
                   IconButton(onPressed: () => Get.to(() => const ProductReviewsScreen()), icon: const Icon(Iconsax.arrow_right_3, size: 18,))
                 ],
               ),
               const SizedBox(height: MySizes.spaceBtwSections,),
             ],
           ),
         ),
         ],
       ),
     ),
    );
  }
}



