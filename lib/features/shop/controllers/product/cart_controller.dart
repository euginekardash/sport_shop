import 'package:get/get.dart';
import 'package:sport_shop/features/shop/controllers/variation_controller.dart';
import 'package:sport_shop/features/shop/models/cart_item_model.dart';
import 'package:sport_shop/features/shop/models/product_model.dart';
import 'package:sport_shop/utils/constants/enums.dart';
import 'package:sport_shop/utils/local_storage/storage_utility.dart';
import 'package:sport_shop/utils/popups/loaders.dart';

class CartController extends GetxController{
  static CartController get instance => Get.find();

  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  final variationController = VariationController.instance;

  CartController(){
    loadCartItems();
  }
  
  void addToCart(ProductModel product){
    if(productQuantityInCart.value < 1){
      MyLoaders.customToast(message: 'Выберите количество');
      return;
    }
    
    if(product.productType == ProductType.variable.toString() && variationController.selectedVariation.value.id.isEmpty){
      MyLoaders.customToast(message: 'Выберите разновидность');
      return;
    }

    if(product.productType == ProductType.variable.toString()){
      if(variationController.selectedVariation.value.stock < 1){
        MyLoaders.warningSnackBar(message: 'Выбранной разновидности нет в наличии', title: 'Ошибка');
        return;
      }
    }else{
      if(product.stock < 1){
        MyLoaders.warningSnackBar(message: 'Выбранного продукта нет в наличии', title: 'Ошибка');
        return;
      }
    }

    final selectedCartItem = convertToCartItem(product, productQuantityInCart.value);

    int index = cartItems.indexWhere(
            (cartItem) => cartItem.productId == selectedCartItem.productId && cartItem.variationId == selectedCartItem.variationId);

    if(index >= 0){
      cartItems[index].quantity = selectedCartItem.quantity;
    }else{
      cartItems.add(selectedCartItem);
    }

    updateCart();
    MyLoaders.customToast(message: 'Продукт добавлен в вашу корзину');
  }

  void addOneToCart(CartItemModel item){
    int index = cartItems.indexWhere((cartItem) => cartItem.productId == item.productId && cartItem.variationId == item.variationId);

    if(index >= 0){
      cartItems[index].quantity += 1;
    }else{
      cartItems.add(item);
    }

    updateCart();
  }

  void removeOneFromCart(CartItemModel item){
    int index = cartItems.indexWhere((cartItem) => cartItem.productId == item.productId && cartItem.variationId == item.variationId);

    if(index >= 0){
      if(cartItems[index].quantity > 1){
        cartItems[index].quantity -= 1;
      }else{
        cartItems[index].quantity == 1 ? removeFromCartDialog(index) : cartItems.removeAt(index);
      }
      updateCart();
    }
  }

  void removeFromCartDialog(int index){
    Get.defaultDialog(
      title: 'Удаление продукта',
      middleText: 'Вы уверены что хотите удалить этот продукт?',
      onConfirm: (){
        cartItems.removeAt(index);
        updateCart();
        MyLoaders.customToast(message: 'Продукт удален из корзины');
        Get.back();
      },
      onCancel: () => () => Get.back(),
    );
  }

  void updateAlreadyAddedProductCount(ProductModel product){
    if(product.productType == ProductType.single.toString()){
      productQuantityInCart.value = getProductQuantityInCart(product.id);
    }else{
      final variationId = variationController.selectedVariation.value.id;
      if(variationId.isNotEmpty){
        productQuantityInCart.value = getVariationQuantityInCart(product.id, variationId);
      }else{
        productQuantityInCart.value = 0;
      }
    }
  }

  CartItemModel convertToCartItem(ProductModel product, int quantity){
    if(product.productType == ProductType.single.toString()){
      variationController.resetSelectedAttribute();
    }

    final variation = variationController.selectedVariation.value;
    final isVariation = variation.id.isNotEmpty;
    final price = isVariation
        ? variation.salePrice > 0.0
          ? variation.salePrice
          : variation.price
        : product.salePrice > 0.0
          ? product.salePrice
          : product.price;
    return CartItemModel(
        productId: product.id,
        title: product.title,
        price: price,
        quantity: quantity,
      variationId: variation.id,
      image: isVariation ? variation.image : product.thumbnail,
      brandName: product.brand != null ? product.brand!.name : '',
      selectedVariation: isVariation ? variation.attributeValues : null,
    );
  }

  void updateCart(){
    updateCartTotals();
    saveCartItems();
    cartItems.refresh();
  }

  void updateCartTotals(){
    double calculatedTotalPrice = 0.0;
    int calculatedNoOfItems = 0;

    for(var item in cartItems){
      calculatedTotalPrice += (item.price) * item.quantity.toDouble();
      calculatedNoOfItems += item.quantity;
    }

    totalCartPrice.value = calculatedTotalPrice;
    noOfCartItems.value = calculatedNoOfItems;
  }

  void saveCartItems(){
    final cartItemStrings = cartItems.map((item) => item.toJson()).toList();
    MyLocalStorage.instance().saveData('cartItems', cartItemStrings);
  }

  void loadCartItems(){
    final cartItemsStrings = MyLocalStorage.instance().readData<List<dynamic>>('cartItems');
    if(cartItemsStrings != null){
      cartItems.assignAll(cartItemsStrings.map((item) => CartItemModel.fromJson(item as Map<String, dynamic>)));
      updateCartTotals();
    }
  }

  int getProductQuantityInCart(String productId){
    final foundItem =
        cartItems.where((item) => item.productId == productId).fold(0, (previousValue, element) => previousValue + element.quantity);
    return foundItem;
  }

  int getVariationQuantityInCart(String productId, String variationId){
    final foundItem = cartItems.firstWhere(
            (item) => item.productId == productId && item.variationId == variationId,
      orElse: () => CartItemModel.empty());
    return foundItem.quantity;
  }

  void clearCart(){
    productQuantityInCart.value = 0;
    cartItems.clear();
    updateCart();
  }
}