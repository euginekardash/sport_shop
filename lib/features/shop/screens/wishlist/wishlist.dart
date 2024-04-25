import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sport_shop/common/styles/vertical_product_shimmer.dart';
import 'package:sport_shop/common/widgets/appbar/appbar.dart';
import 'package:sport_shop/common/widgets/icons/circular_icon.dart';
import 'package:sport_shop/common/widgets/layouts/grid_layout.dart';
import 'package:sport_shop/common/widgets/loaders/animation_loader.dart';
import 'package:sport_shop/common/widgets/products/products_cards/product_card_vertical.dart';
import 'package:sport_shop/features/shop/controllers/product/favourites_controller.dart';
import 'package:sport_shop/features/shop/models/product_model.dart';
import 'package:sport_shop/features/shop/screens/home/home.dart';
import 'package:sport_shop/navigation_menu.dart';
import 'package:sport_shop/utils/constants/sizes.dart';
import 'package:sport_shop/utils/helpers/cloud_helper_functions.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavouritesController.instance;
    return Scaffold(
      appBar: MyAppBar(
        title: Text('Избранное', style: Theme.of(context).textTheme.headlineMedium,),
        actions: [
          CircularIcon(icon: Iconsax.add, onPressed: () => Get.offAll(() => const NavigationMenu()),)
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MySizes.defaultSpace),
          child: Column(
            children: [
              Obx(
              () => FutureBuilder(
                  future: controller.favoriteProducts(),
                  builder: (context, snapshot) {

                    final emptyWidget = MyAnimationLoaderWidget(
                        text: 'Здесь будут избранные товары',
                        animation: 'assets/images/animations/loading.json',
                      showAction: true,
                      actionText: 'Давайте добавим товары',
                      onActionPressed: () => Get.offAll(() => const NavigationMenu()),
                    );

                    const loader = VerticalProductShimmer(itemCount: 6,);
                    final widget = CloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader, nothingFound: emptyWidget);
                    if(widget != null) return widget;

                    final products = snapshot.data!;
                    return MyGridLayout(
                        itemCount: products.length,
                        itemBuilder: (_, index) => ProductCardVertical(product: products[index],
                        )
                    );
                  }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
