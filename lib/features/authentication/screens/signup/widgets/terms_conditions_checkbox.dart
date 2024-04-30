import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:sport_shop/features/authentication/controllers.onboarding/signup/signup_controller.dart';
import 'package:sport_shop/utils/constants/colors.dart';
import 'package:sport_shop/utils/constants/sizes.dart';
import 'package:sport_shop/utils/helpers/helper_functions.dart';


class MyTermsAndConditionCheckBox extends StatelessWidget {
  const MyTermsAndConditionCheckBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final dark = MyHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
            width: 24,
            height: 24,
            child: Obx(() => Checkbox(
                value: controller.privacyPolicy.value,
                onChanged: (value) => controller.privacyPolicy.value = !controller.privacyPolicy.value))),
        const SizedBox(width: MySizes.spaceBtwItems,),
        Text.rich(TextSpan(

            children: [
              TextSpan(text: "Я согласен с  ", style: Theme.of(context).textTheme.bodySmall),
              /*TextSpan(text: "Политика конфеденциальности", style: Theme.of(context).textTheme.bodyMedium!.apply(
                color: dark ? MyColors.white : MyColors.primary,
                decoration: TextDecoration.underline,
                decorationColor: dark ? MyColors.white : MyColors.primary,
              )),*/
              //TextSpan(text: " и ", style: Theme.of(context).textTheme.bodySmall),
              TextSpan(text: "Условия использования", style: Theme.of(context).textTheme.bodyMedium!.apply(
                color: dark ? MyColors.white : MyColors.primary,
                decoration: TextDecoration.underline,
                decorationColor: dark ? MyColors.white : MyColors.primary,
              )),
            ]
        ))
      ],
    );
  }
}