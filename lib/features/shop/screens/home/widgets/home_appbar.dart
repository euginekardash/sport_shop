import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:sport_shop/common/styles/shimmer.dart';
import 'package:sport_shop/common/widgets/appbar/appbar.dart';
import 'package:sport_shop/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:sport_shop/features/personalization/controllers/user_controller.dart';
import 'package:sport_shop/utils/constants/colors.dart';
import 'package:sport_shop/utils/constants/text_strings.dart';

class MyHomeAppBar extends StatelessWidget {
  const MyHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return MyAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(MyTexts.homeAppbarTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: MyColors.grey)),
          Obx(() {
            if(controller.profileLoading.value){
              return const ShimmerEffect(width: 80, height: 15);
            } else {
              return Text(controller.user.value.fullName, style: Theme.of(context).textTheme.headlineSmall!.apply(color: MyColors.white));
            }
          }),
        ],
      ),
      actions: [
        MyCartCounterIcon(onPressed: () {}, iconColor: Colors.white, )
      ],
    );
  }
}