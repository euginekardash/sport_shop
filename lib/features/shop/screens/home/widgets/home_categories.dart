import 'package:flutter/material.dart';
import 'package:sport_shop/common/widgets/image_text_widgets/vertical_image_text.dart';

class MyHomeCategories extends StatelessWidget {
  const MyHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return MyVerticalmaheText(image: 'assets/logos/logo_black.png', title: 'Shoes', onTap: (){},);
        },
      ),
    );
  }
}