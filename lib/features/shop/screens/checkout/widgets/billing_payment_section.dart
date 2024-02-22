import 'package:flutter/material.dart';
import 'package:sport_shop/common/widgets/containers/rounded_container.dart';
import 'package:sport_shop/common/widgets/texts/section_heading.dart';
import 'package:sport_shop/utils/constants/colors.dart';
import 'package:sport_shop/utils/constants/image_strings.dart';
import 'package:sport_shop/utils/constants/sizes.dart';
import 'package:sport_shop/utils/helpers/helper_functions.dart';

class BillingPaymentSection extends StatelessWidget {
  const BillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        MySectionHeading(title: 'Payment Method', buttonTitle: 'Change', onPressed: (){}, showActionButton: true,),
        const SizedBox(height:  MySizes.spaceBtwItems/2,),
        Row(
          children: [
            MyRoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: dark ? MyColors.light : MyColors.white,
              padding: const EdgeInsets.all(MySizes.sm),
              child: const Image(image: AssetImage(MyImages.applePay), fit: BoxFit.contain,),
            ),
            const SizedBox(height:  MySizes.spaceBtwItems/2,),
            Text('ApplePay', style: Theme.of(context).textTheme.bodyLarge,),
          ],
        )
      ],
    );
  }
}
