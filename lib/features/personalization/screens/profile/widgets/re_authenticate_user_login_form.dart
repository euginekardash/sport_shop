import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sport_shop/features/personalization/controllers/user_controller.dart';
import 'package:sport_shop/utils/constants/sizes.dart';
import 'package:sport_shop/utils/validators/validation.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: AppBar(title: const Text("Re-Authenticate User"),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MySizes.defaultSpace),
          child: Form(
            key: controller.reAuthFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: controller.verifyEmail,
                  validator: MyValidator.validateEmail,
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.direct_right), labelText: "Email"),
                ),
                const SizedBox(height: MySizes.spaceBtwInputFields,),
                Obx(
                    () => TextFormField(
                      obscureText: controller.hidePassword.value,
                      controller: controller.verifyPassword,
                      validator: (value) => MyValidator.validateEmptyText('Password', value),
                      decoration: InputDecoration(prefixIcon: Icon(Iconsax.password_check), labelText: "Password", suffixIcon: IconButton(onPressed: () => controller.hidePassword.value = !controller.hidePassword.value, icon: const Icon(Iconsax.eye_slash))),
                    ),
                ),
                const SizedBox(height: MySizes.spaceBtwSections,),

                ///LOGIN
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: () => controller.reAuthenticateEmailAndPasswordUser(), child: const Text('Verify'),),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
