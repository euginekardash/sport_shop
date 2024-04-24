import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sport_shop/common/widgets/containers/rounded_container.dart';
import 'package:sport_shop/features/shop/controllers/product/checkout_controller.dart';
import 'package:sport_shop/features/shop/models/payment_method_model.dart';
import 'package:sport_shop/utils/constants/colors.dart';
import 'package:sport_shop/utils/constants/sizes.dart';
import 'package:sport_shop/utils/helpers/helper_functions.dart';

class PaymentTile extends StatelessWidget {
  const PaymentTile({super.key, required this.paymentMethod});

  final PaymentMethodModel paymentMethod;

  @override
  Widget build(BuildContext context) {
    final controller = CheckoutController.instance;
    return ListTile(
        contentPadding: const EdgeInsets.all(0),
        onTap: (){
          controller.selectedPaymentMethod.value = paymentMethod;
          Get.back();
        },
        leading: MyRoundedContainer(
          width: 60,
          height: 40,
          backgroundColor: MyHelperFunctions.isDarkMode(context) ? MyColors.light : MyColors.white,
          padding: const EdgeInsets.all(MySizes.sm),
          child: Image(image: AssetImage(paymentMethod.image), fit: BoxFit.contain),
        ),
        title: Text(paymentMethod.name),
        trailing: const Icon(Iconsax.arrow_right_34),
      );
  }
}
