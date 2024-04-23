import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sport_shop/common/widgets/appbar/appbar.dart';
import 'package:sport_shop/features/personalization/controllers/address_controller.dart';
import 'package:sport_shop/utils/constants/sizes.dart';
import 'package:sport_shop/utils/validators/validation.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    return Scaffold(
      appBar: const MyAppBar(showBackArrow: true, title: Text('Add new address'),),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(MySizes.defaultSpace),
          child: Form(
            key: controller.addressFormKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.name,
                  validator: (value) => MyValidator.validateEmptyText('Имя', value),
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.user), labelText: 'Имя'),
                ),
                const SizedBox(height: MySizes.spaceBtwInputFields,),
                TextFormField(
                  controller: controller.phoneNumber,
                  validator: MyValidator.phoneNumber,
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.mobile), labelText: 'Номер телефона'),
                ),
                const SizedBox(height: MySizes.spaceBtwInputFields,),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.street,
                        validator: (value) => MyValidator.validateEmptyText('Улица', value),
                        decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building_31), labelText: 'Улица'),
                      ),
                    ),
                    const SizedBox(width: MySizes.spaceBtwInputFields,),
                    Expanded(
                      child: TextFormField(
                        controller: controller.postalCode,
                          validator: (value) => MyValidator.validateEmptyText('Почтовый индекс', value),
                        decoration: const InputDecoration(prefixIcon: Icon(Iconsax.code), labelText: 'Почтовый индекс'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: MySizes.spaceBtwInputFields,),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.city,
                        validator: (value) => MyValidator.validateEmptyText('Город', value),
                        expands: false,
                        decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building), labelText: 'Город'),
                      ),
                    ),
                    const SizedBox(width: MySizes.spaceBtwInputFields,),
                    Expanded(
                      child: TextFormField(
                        controller: controller.region,
                          validator: (value) => MyValidator.validateEmptyText('Регион', value),
                        expands: false,
                        decoration: const InputDecoration(prefixIcon: Icon(Iconsax.activity), labelText: 'Регион'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: MySizes.spaceBtwInputFields,),
                TextFormField(
                  controller: controller.country,
                    validator: (value) => MyValidator.validateEmptyText('Страна', value),
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.global), labelText: 'Страна'),
                ),
                const SizedBox(height: MySizes.defaultSpace,),
                SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => controller.addNewAddresses(), child: Text('Сохранить'),),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
