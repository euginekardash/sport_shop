import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sport_shop/common/widgets/containers/rounded_container.dart';
import 'package:sport_shop/features/personalization/controllers/address_controller.dart';
import 'package:sport_shop/features/personalization/models/address_model.dart';
import 'package:sport_shop/utils/constants/colors.dart';
import 'package:sport_shop/utils/constants/sizes.dart';
import 'package:sport_shop/utils/helpers/helper_functions.dart';

class SingleAddress extends StatelessWidget {
  const SingleAddress({super.key, required this.address, required this.onTap,});

  final AddressModel address;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;

    final dark = MyHelperFunctions.isDarkMode(context);
    return Obx(
      () {
        final selectedAddressId = controller.selectedAddress.value.id;
        final selectedAddress = selectedAddressId == address.id;
        return InkWell(
        onTap: onTap,
        child: MyRoundedContainer(
          width: double.infinity,
          showBorder: true,
          padding: const EdgeInsets.all(MySizes.md),
          backgroundColor: selectedAddress ? MyColors.primary.withOpacity(0.5) : Colors.transparent,
          borderColor: selectedAddress
              ? Colors.transparent
              : dark
              ? MyColors.darkerGrey
              : MyColors.grey,
          margin: const EdgeInsets.only(bottom: MySizes.spaceBtwItems),
          child: Stack(
            children: [
              Positioned(
                right: 5,
                top: 0,
                child: Icon(selectedAddress ? Iconsax.tick_circle5 : null,
                  color: selectedAddress
                      ? dark
                      ? MyColors.light
                      : MyColors.dark.withOpacity(0.8)
                      : null,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    address.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: MySizes.sm/2,),
                  Text(address.formattedPhoneNo, maxLines: 1, overflow: TextOverflow.ellipsis,),
                  const SizedBox(height: MySizes.sm/2,),
                  Text(address.toString(), softWrap: true,),
                ],
              )
            ],
          ),
        ),
      );}
    );
  }
}
