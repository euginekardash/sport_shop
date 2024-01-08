import 'package:flutter/material.dart';
import 'package:sport_shop/utils/constants/colors.dart';
import 'package:sport_shop/utils/constants/sizes.dart';
import 'package:sport_shop/utils/helpers/helper_functions.dart';


class MyTermsAndConditionCheckBox extends StatelessWidget {
  const MyTermsAndConditionCheckBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(width:24, height: 24, child: Checkbox(value: true, onChanged: (value){})),
        const SizedBox(width: MySizes.spaceBtwItems,),
        Text.rich(TextSpan(
            children: [
              TextSpan(text: "I agree to ", style: Theme.of(context).textTheme.bodySmall),
              TextSpan(text: "Privacy Policy", style: Theme.of(context).textTheme.bodyMedium!.apply(
                color: dark ? MyColors.white : MyColors.primary,
                decoration: TextDecoration.underline,
                decorationColor: dark ? MyColors.white : MyColors.primary,
              )),
              TextSpan(text: " and ", style: Theme.of(context).textTheme.bodySmall),
              TextSpan(text: "Terms of use", style: Theme.of(context).textTheme.bodyMedium!.apply(
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