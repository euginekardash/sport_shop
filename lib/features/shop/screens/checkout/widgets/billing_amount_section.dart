import 'package:flutter/material.dart';
import 'package:sport_shop/features/shop/controllers/product/cart_controller.dart';
import 'package:sport_shop/utils/constants/sizes.dart';
import 'package:sport_shop/utils/helpers/pricing_calculator.dart';

class BillingAmountSection extends StatelessWidget {
  const BillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;
    return Column(
      children: [
        ///SubTotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Цена продуктов', style: Theme.of(context).textTheme.bodyMedium,),
            Text('$subTotal р.', style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
        const SizedBox(height: MySizes.spaceBtwItems / 2,),

        ///Shipping Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Стоимость доставки', style: Theme.of(context).textTheme.bodyMedium,),
            Text('${MyPricingCalculator.calculateShippingCost(subTotal, "руб")} р.', style: Theme.of(context).textTheme.labelLarge,),
          ],
        ),
        const SizedBox(height: MySizes.spaceBtwItems / 2,),

        ///Tax Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('НДС', style: Theme.of(context).textTheme.bodyMedium,),
            Text('${MyPricingCalculator.calculateTax(subTotal, 'руб')} р.', style: Theme.of(context).textTheme.labelLarge,),
          ],
        ),

        const SizedBox(height: MySizes.spaceBtwItems / 2,),

        ///Order Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Итого', style: Theme.of(context).textTheme.bodyMedium,),
            Text('${MyPricingCalculator.calculateTotalPrice(subTotal, 'руб')} р.', style: Theme.of(context).textTheme.titleLarge,),
          ],
        ),
      ],
    );
  }
}
