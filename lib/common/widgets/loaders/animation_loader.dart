import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sport_shop/utils/constants/colors.dart';
import 'package:sport_shop/utils/constants/sizes.dart';

class MyAnimationLoaderWidget extends StatelessWidget {
  const MyAnimationLoaderWidget({
    super.key,
    required this.text,
    required this.animation,
    this.showAction = false,
    this.actionText,
    this.onActionPressed});

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(animation, width: MediaQuery.of(context).size.width * 0.8),
          const SizedBox(height: MySizes.defaultSpace,),
          Text(text, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center,),
          const SizedBox(height: MySizes.defaultSpace,),
          showAction
          ? SizedBox(
            width: 250,
            child: OutlinedButton(
              onPressed: onActionPressed,
              style: OutlinedButton.styleFrom(backgroundColor: MyColors.dark),
              child: Text(
                actionText!,
                style: Theme.of(context).textTheme.bodyMedium!.apply(color: MyColors.light),
              ),
            ),
          )
              : const SizedBox(),
        ],
      ),
    );
  }
}
