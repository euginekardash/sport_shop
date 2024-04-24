import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_shop/common/widgets/texts/section_heading.dart';
import 'package:sport_shop/utils/constants/enums.dart';
import 'package:sport_shop/utils/constants/image_strings.dart';
import 'package:sport_shop/utils/constants/sizes.dart';

import '../../../../common/widgets/products/cart/payment_tile.dart';
import '../../models/payment_method_model.dart';

class CheckoutController extends GetxController{
  static CheckoutController get instance => Get.find();
  
  final Rx<PaymentMethodModel> selectedPaymentMethod = PaymentMethodModel.empty().obs;

  @override
  void onInit() {
    selectedPaymentMethod.value = PaymentMethodModel(image: MyImages.paypal, name: "PayPal");
    super.onInit();
  }

  Future<dynamic> selectPaymentMethod(BuildContext context){
    return showModalBottomSheet(
        context: context,
        builder: (_) => SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(MySizes.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MySectionHeading(title: 'Выберите метод оплаты', showActionButton: false,),
                SizedBox(height: MySizes.spaceBtwSections,),
                PaymentTile(paymentMethod: PaymentMethodModel(image: MyImages.paypal, name: 'PayPal')),
                SizedBox(height: MySizes.spaceBtwItems/2,),
                PaymentTile(paymentMethod: PaymentMethodModel(image: MyImages.applePay, name: 'ApplePay')),
                SizedBox(height: MySizes.spaceBtwItems/2,),
                PaymentTile(paymentMethod: PaymentMethodModel(image: MyImages.masterCard, name: 'MasterCard')),
                SizedBox(height: MySizes.spaceBtwItems/2,),
                PaymentTile(paymentMethod: PaymentMethodModel(image: MyImages.visa, name: 'Visa')),
                SizedBox(height: MySizes.spaceBtwItems/2,),
                SizedBox(height: MySizes.spaceBtwSections,),
              ],
            ),
          ),
        )
    );
  }
}