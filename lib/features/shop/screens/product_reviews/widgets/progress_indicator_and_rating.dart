import 'package:flutter/material.dart';
import 'package:sport_shop/utils/constants/colors.dart';
import 'package:sport_shop/utils/device/device_utility.dart';

class RatingProgressIndicator extends StatelessWidget {
  const RatingProgressIndicator({
    super.key, required this.text, required this.value,
  });

  final String text;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1,child: Text(text, style: Theme.of(context).textTheme.bodyMedium,)),
        Expanded(
          flex: 11,
          child: SizedBox(
            width: MyDeviceUtils.getScreenWidth(context)*0.8,
            child: LinearProgressIndicator(
              value: value,
              minHeight: 11,
              backgroundColor: MyColors.grey,
              borderRadius: BorderRadius.circular(7),
              valueColor: const AlwaysStoppedAnimation(MyColors.primary),
            ),
          ),
        )
      ],
    );
  }
}