import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sport_shop/common/widgets/appbar/appbar.dart';
import 'package:sport_shop/features/personalization/controllers/update_name_controller.dart';
import 'package:sport_shop/utils/constants/sizes.dart';
import 'package:sport_shop/utils/validators/validation.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: MyAppBar(
        showBackArrow: true,
        title: Text('Изменить имя', style: Theme.of(context).textTheme.headlineSmall,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(MySizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Используйте свое настоящее имя и фамилию',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: MySizes.spaceBtwSections,),

            Form(
              key: controller.updateUserNameFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.firstName,
                    validator: (value) => MyValidator.validateEmptyText('First name', value),
                    expands: false,
                    decoration: const InputDecoration(labelText: 'Имя', prefixIcon: Icon(Iconsax.user)),
                  ),
                  const SizedBox(height: MySizes.spaceBtwInputFields,),
                  TextFormField(
                    controller: controller.lastName,
                    validator: (value) => MyValidator.validateEmptyText('Last name', value),
                    expands: false,
                    decoration: const InputDecoration(labelText: 'Фамилия', prefixIcon: Icon(Iconsax.user), ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: MySizes.spaceBtwSections,),

            ///save
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () => controller.updateUserName(), child: const Text('Сохранить'),),
            )
          ],
        ),
      ),
    );
  }
}
