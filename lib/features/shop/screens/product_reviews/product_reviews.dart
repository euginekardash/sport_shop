import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sport_shop/common/widgets/appbar/appbar.dart';
import 'package:sport_shop/common/widgets/products/ratings/rating_indicator.dart';
import 'package:sport_shop/features/shop/screens/product_reviews/widgets/progress_indicator_and_rating.dart';
import 'package:sport_shop/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:sport_shop/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:sport_shop/utils/constants/colors.dart';
import 'package:sport_shop/utils/constants/sizes.dart';
import 'package:sport_shop/utils/device/device_utility.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///appbar
      appBar: MyAppBar(title: Text('Reviews & Ratings'), showBackArrow: true,),

      ///body
      body: SingleChildScrollView(
        padding: EdgeInsets.all(MySizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Rating and reviews are verified and are from people who use the same type of device that you use.'),
            const SizedBox(height: MySizes.spaceBtwItems,),

            ///overall product rating
            OverallProductRating(),
            MyRatingBarIndicator(rating: 3.5,),
            Text('12.611', style: Theme.of(context).textTheme.bodySmall,),
            const SizedBox(height: MySizes.spaceBtwSections,),

            ///User reviews list
            const UserReviewCard(),
            const UserReviewCard(),
            const UserReviewCard(),
            const UserReviewCard(),
          ],
        ),
      ),

    );
  }
}





