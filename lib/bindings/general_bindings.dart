import 'package:get/get.dart';
import 'package:sport_shop/features/personalization/controllers/address_controller.dart';
import 'package:sport_shop/features/shop/controllers/product/checkout_controller.dart';
import 'package:sport_shop/features/shop/controllers/variation_controller.dart';
import 'package:sport_shop/utils/helpers/network_manager.dart';

class GeneralBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(VariationController());
    Get.put(AddressController());
    Get.put(CheckoutController());
  }
}