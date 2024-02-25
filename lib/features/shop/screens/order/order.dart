import 'package:flutter/material.dart';
import 'package:sport_shop/common/widgets/appbar/appbar.dart';
import 'package:sport_shop/features/shop/screens/order/widgets/orders_list.dart';
import 'package:sport_shop/utils/constants/sizes.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: Text('My Orders' , style: Theme.of(context).textTheme.headlineSmall,),),
      body: Padding(
        padding: EdgeInsets.all(MySizes.defaultSpace),

        child: OrderListItems(),
      ),
    );
  }
}
