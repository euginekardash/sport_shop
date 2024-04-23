import 'package:get/get.dart';
import 'package:sport_shop/features/shop/controllers/variation_controller.dart';
import 'package:sport_shop/utils/helpers/network_manager.dart';

class GeneralBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(VariationController());
  }
}