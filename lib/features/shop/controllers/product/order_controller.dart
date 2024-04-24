import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sport_shop/common/widgets/success_screen/success_screen.dart';
import 'package:sport_shop/data/repositories/authentication_repository.dart';
import 'package:sport_shop/features/personalization/controllers/address_controller.dart';
import 'package:sport_shop/features/shop/controllers/product/cart_controller.dart';
import 'package:sport_shop/features/shop/controllers/product/checkout_controller.dart';
import 'package:sport_shop/navigation_menu.dart';
import 'package:sport_shop/utils/constants/enums.dart';
import 'package:sport_shop/utils/popups/full_screen_loader.dart';
import 'package:sport_shop/utils/popups/loaders.dart';

import '../../../../data/repositories/orders/order_repository.dart';
import '../../models/order_model.dart';

class OrderController extends GetxController{
  static OrderController get instance => Get.find();

  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckoutController.instance;
  final orderRepository = Get.put(OrderRepository());

  Future<List<OrderModel>> fetchUserOrders() async{
    try{
      final userOrders = await orderRepository.fetchUserOrders();
      return userOrders;
    }catch(e){
      MyLoaders.warningSnackBar(title: 'Ошибка', message: e.toString());
      return[];
    }
  }

  void processOrder(double totalAmount) async{
    try{
      MyFullScreenLoader.openLoadingDialog('Обработка ваших заказов...', 'assets/images/animations/loading.json');

      final userId = AuthenticationRepository.instance.authUser.uid;
      if(userId.isEmpty) return;

      final order = OrderModel(
        id: UniqueKey().toString(),
        userId: userId,
        status: OrderStatus.pending,
        totalAmount: totalAmount,
        orderDate: DateTime.now(),
        paymentMethod: checkoutController.selectedPaymentMethod.value.name,
        address: addressController.selectedAddress.value,
        deliveryDate: DateTime.now(),
        items: cartController.cartItems.toList(),
      );

      await orderRepository.saveOrder(order, userId);

      cartController.clearCart();

      Get.off(() => SuccessScreen(
        image: 'assets/images/animations/free-icon-check-mark-4225683.png',
        title: 'Оплачено успешно',
        subTitle: 'Ваш заказ скоро будет доставлен',
        onPressed: () => Get.offAll(() => const NavigationMenu()),
      ));
    }catch(e){
      MyLoaders.errorSnackBar(title: 'Ошибка', message: e.toString());
    }
  }
}