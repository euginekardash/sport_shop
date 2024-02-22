import 'package:flutter/material.dart';
import 'package:sport_shop/common/widgets/texts/section_heading.dart';
import 'package:sport_shop/utils/constants/sizes.dart';

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MySectionHeading(title: 'Shipping Address', buttonTitle: 'Change', showActionButton: true, onPressed: (){},),
        Text('Eugene Kardash', style: Theme.of(context).textTheme.bodyLarge,),
        const SizedBox(height: MySizes.spaceBtwItems/2,),


        Row(
          children: [
            const Icon(Icons.phone, color: Colors.grey, size: 16,),
            const SizedBox(width: MySizes.spaceBtwItems,),
            Text('+375447189386', style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
        const SizedBox(height: MySizes.spaceBtwItems/2,),
        Row(
          children: [
            const Icon(Icons.location_history, color: Colors.grey, size: 16,),
            const SizedBox(width: MySizes.spaceBtwItems,),
            Text('Minsk', style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
      ],
    );
  }
}
