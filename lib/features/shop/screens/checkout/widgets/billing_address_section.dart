import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_shop/common/widgets/texts/section_heading.dart';
import 'package:sport_shop/features/personalization/controllers/address_controller.dart';
import 'package:sport_shop/utils/constants/sizes.dart';

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final addressController = AddressController.instance;
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MySectionHeading(title: 'Адрес доставки', buttonTitle: 'Изменить', showActionButton: true, onPressed: () => addressController.selectNewAddressPopup(context),),
          addressController.selectedAddress.value.id.isNotEmpty ?
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
          ) : Text("Выберите адрес", style: Theme.of(context).textTheme.bodyMedium,),

        ],
      ),
    );
  }
}
