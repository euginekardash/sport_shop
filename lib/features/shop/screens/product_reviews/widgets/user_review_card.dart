import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:sport_shop/common/widgets/containers/rounded_container.dart';
import 'package:sport_shop/common/widgets/products/ratings/rating_indicator.dart';
import 'package:sport_shop/utils/constants/colors.dart';
import 'package:sport_shop/utils/constants/image_strings.dart';
import 'package:sport_shop/utils/constants/sizes.dart';
import 'package:sport_shop/utils/helpers/helper_functions.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(backgroundImage: AssetImage(MyImages.userProfileImage1),),
                const SizedBox(width: MySizes.spaceBtwItems,),
                Text('Jack Kardash', style: Theme.of(context).textTheme.titleLarge,),

              ],
            ),
            IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        const SizedBox(width: MySizes.spaceBtwItems,),

        ///Review
        Row(
          children: [
            const MyRatingBarIndicator(rating: 4),
            const SizedBox(width: MySizes.spaceBtwItems,),
            Text('01 Nov, 2023', style: Theme.of(context).textTheme.bodyMedium,)
          ],
        ),
        const SizedBox(width: MySizes.spaceBtwItems,),
        const ReadMoreText('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: ' show less',
          trimCollapsedText: ' show more',
          moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: MyColors.primary),
          lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: MyColors.primary),
        ),
        const SizedBox(width: MySizes.spaceBtwItems,),

        ///Company Review
        MyRoundedContainer(
          backgroundColor: dark? MyColors.darkerGrey : MyColors.grey,
          child: Padding(
            padding: EdgeInsets.all(MySizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Easy Sport", style: Theme.of(context).textTheme.titleMedium,),
                    Text('02 Nov, 2023', style: Theme.of(context).textTheme.bodyMedium,)
                  ],
                ),
                const SizedBox(width: MySizes.spaceBtwItems,),
                const ReadMoreText('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: ' show less',
                  trimCollapsedText: ' show more',
                  moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: MyColors.primary),
                  lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: MyColors.primary),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: MySizes.spaceBtwSections,),
      ],
    );
  }
}
