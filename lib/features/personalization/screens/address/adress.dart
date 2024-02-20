import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sport_shop/common/widgets/appbar/appbar.dart';
import 'package:sport_shop/common/widgets/containers/rounded_container.dart';
import 'package:sport_shop/features/personalization/screens/address/add_new_address.dart';
import 'package:sport_shop/features/personalization/screens/address/widgets/single_address.dart';
import 'package:sport_shop/utils/constants/colors.dart';
import 'package:sport_shop/utils/constants/sizes.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        backgroundColor: MyColors.primary,
        child: const Icon(Iconsax.add, color: Colors.white,),
      ),
      appBar: MyAppBar(
        showBackArrow: true,
        title: Text('Addresses', style: Theme.of(context).textTheme.headlineSmall,),
      ),
      body: const SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(MySizes.defaultSpace),
          child: Column(
            children: [
              SingleAddress(selectedAddress: false),
              SingleAddress(selectedAddress: true),
            ],
          ),
        ),
      ),
    );
  }
}
