import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sport_shop/common/widgets/containers/rounded_container.dart';
import 'package:sport_shop/common/widgets/loaders/animation_loader.dart';
import 'package:sport_shop/features/shop/controllers/product/order_controller.dart';
import 'package:sport_shop/navigation_menu.dart';
import 'package:sport_shop/utils/constants/colors.dart';
import 'package:sport_shop/utils/constants/sizes.dart';
import 'package:sport_shop/utils/helpers/cloud_helper_functions.dart';
import 'package:sport_shop/utils/helpers/helper_functions.dart';

class OrderListItems extends StatelessWidget {
  const OrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    final controller = Get.put(OrderController());
    return FutureBuilder(
      future: controller.fetchUserOrders(),
      builder: (_, snapshot) {

        final emptyWidget = MyAnimationLoaderWidget(
          text: 'Заказов нет',
          animation: 'assets/images/animations/loading.json',
          showAction: true,
          actionText: 'Давайте сделаем новые заказы',
          onActionPressed: () => Get.off(() => const NavigationMenu()),
        );

        final response = CloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, nothingFound: emptyWidget);
        if(response != null) return response;

        final orders = snapshot.data!;
        return ListView.separated(
          shrinkWrap: true,
          itemCount: orders.length,
          separatorBuilder: (_, index) => const SizedBox(height: MySizes.spaceBtwItems,),
          itemBuilder: (_, index) {
            final order = orders[index];
            return MyRoundedContainer(
            showBorder: true,
            padding: const EdgeInsets.all(MySizes.md),
            backgroundColor: dark ? MyColors.dark : MyColors.light,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Icon(Iconsax.ship),
                    SizedBox(width: MySizes.spaceBtwItems/2,),

                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(order.orderStatusText, style: Theme.of(context).textTheme.bodyLarge!.apply(color: MyColors.primary, fontSizeDelta: 1),),
                          Text(order.formattedOrderDate, style: Theme.of(context).textTheme.headlineSmall,),
                        ],

                      ),
                    ),

                    IconButton(onPressed: (){}, icon: const Icon(Iconsax.arrow_right_34, size: MySizes.iconSm,))
                  ],
                ),
                const SizedBox(height: MySizes.spaceBtwItems,),

                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Icon(Iconsax.tag),
                          SizedBox(width: MySizes.spaceBtwItems/2,),

                          Flexible(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Заказ',maxLines: 1,overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.labelMedium),
                                Text(order.id,maxLines: 1,overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.titleMedium,),
                              ],

                            ),
                          ),

                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Icon(Iconsax.calendar),
                          SizedBox(width: MySizes.spaceBtwItems/2,),

                          Flexible(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Дата доставки',maxLines: 1,overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.labelMedium),
                                Text(order.formattedDeliveryDate,maxLines: 1,overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.titleMedium,),
                              ],

                            ),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );}
        );
      }
    );
  }
}
