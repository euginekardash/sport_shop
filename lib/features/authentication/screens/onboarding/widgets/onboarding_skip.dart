import 'package:flutter/material.dart';
import 'package:sport_shop/features/authentication/controllers.onboarding/onboarding_controller.dart';
import 'package:sport_shop/utils/constants/sizes.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 25,
        right: MySizes.defaultSpace - 5,
        child: TextButton(
          onPressed: () => OnBoardingController.instance.skipPage(),
          child: const Text('Skip'),)
    );
  }
}