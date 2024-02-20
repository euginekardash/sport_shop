import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sport_shop/common/widgets/containers/rounded_container.dart';
import 'package:sport_shop/utils/constants/colors.dart';
import 'package:sport_shop/utils/constants/sizes.dart';
import 'package:sport_shop/utils/helpers/helper_functions.dart';

class SingleAddress extends StatelessWidget {
  const SingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    return MyRoundedContainer(
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
                'Jack Kardash',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: MySizes.sm/2,),
              const Text('+375(44)7189386', maxLines: 1, overflow: TextOverflow.ellipsis,),
              const SizedBox(height: MySizes.sm/2,),
              const Text('Minsk', softWrap: true,),
            ],
          )
        ],
      ),
    );
  }
}
