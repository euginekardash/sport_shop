import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_shop/common/widgets/appbar/appbar.dart';
import 'package:sport_shop/common/widgets/containers/rounded_container.dart';
import 'package:sport_shop/common/widgets/products/cart/coupon_widget.dart';
import 'package:sport_shop/common/widgets/success_screen/success_screen.dart';
import 'package:sport_shop/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:sport_shop/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:sport_shop/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:sport_shop/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:sport_shop/navigation_menu.dart';
import 'package:sport_shop/utils/constants/colors.dart';
import 'package:sport_shop/utils/constants/image_strings.dart';
import 'package:sport_shop/utils/constants/sizes.dart';
import 'package:sport_shop/utils/helpers/helper_functions.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: MyAppBar(
        title: Text('Order Review', style: Theme.of(context).textTheme.headlineSmall,),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(MySizes.defaultSpace),
        child: Column(
          children: [
            CartItems(showAddRemoveButtons: false,),
            SizedBox(height: MySizes.spaceBtwSections,),

            ///coupon
            CouponCode(),
            SizedBox(height: MySizes.spaceBtwSections,),

            ///billing section
            MyRoundedContainer(
              showBorder: true,
              padding: const EdgeInsets.all(MySizes.md),
              backgroundColor: dark ? Colors.black: MyColors.white,
              child: Column(
                children: [
                  ///pricing
                  BillingAmountSection(),
                  const SizedBox(height: MySizes.spaceBtwItems,),

                  ///divider
                  const Divider(),
                  const SizedBox(height: MySizes.spaceBtwItems,),

                  ///payment
                  BillingPaymentSection(),
                  const SizedBox(height: MySizes.spaceBtwItems,),
                  ///address
                  BillingAddressSection(),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(MySizes.defaultSpace),
        child: ElevatedButton(onPressed: () => Get.to(() => SuccessScreen(image: MyImages.successfulPaymentIcon, title: 'Payment success!', subTitle: 'Your items will be shipped soon!', onPressed: () => Get.offAll(() => const NavigationMenu()))), child: const Text('Checkout \$255'),),
      ),
    );
  }
}


