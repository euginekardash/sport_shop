import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sport_shop/common/widgets/appbar/appbar.dart';
import 'package:sport_shop/common/widgets/containers/rounded_container.dart';
import 'package:sport_shop/features/personalization/controllers/address_controller.dart';
import 'package:sport_shop/features/personalization/screens/address/add_new_address.dart';
import 'package:sport_shop/features/personalization/screens/address/widgets/single_address.dart';
import 'package:sport_shop/utils/constants/colors.dart';
import 'package:sport_shop/utils/constants/sizes.dart';
import 'package:sport_shop/utils/helpers/cloud_helper_functions.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        backgroundColor: MyColors.primary,
        child: const Icon(Iconsax.add, color: Colors.white,),
      ),
      appBar: MyAppBar(
        showBackArrow: true,
        title: Text('Адреса', style: Theme.of(context).textTheme.headlineSmall,),
      ),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(MySizes.defaultSpace),
          child: Obx(
              () => FutureBuilder(
              key: Key(controller.refreshData.value.toString()),
              future: controller.allUserAddresses(),
              builder: (context, snapshot) {

                final response = CloudHelperFunctions.checkMultiRecordState(snapshot: snapshot);
                if(response != null) return response;

                final addresses = snapshot.data!;
                return ListView.builder(
                  shrinkWrap: true,
                    itemCount: addresses.length,
                    itemBuilder: (_, index) => SingleAddress(
                      address: addresses[index],
                      onTap:() => controller.selectAddress(addresses[index]),
                    )
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}
