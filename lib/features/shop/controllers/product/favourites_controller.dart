import 'dart:convert';

import 'package:get/get.dart';
import 'package:sport_shop/data/repositories/product/product_repository.dart';
import 'package:sport_shop/features/shop/models/product_model.dart';
import 'package:sport_shop/utils/local_storage/storage_utility.dart';
import 'package:sport_shop/utils/popups/loaders.dart';

class FavouritesController extends GetxController{
  static FavouritesController get instance => Get.find();
  
  final favorites = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    initFavourites();
  }

  void initFavourites() async{
    final json = MyLocalStorage.instance().readData('favorites');
    if(json != null){
      final storedFavorites = jsonDecode(json) as Map<String, dynamic>;
      favorites.assignAll(storedFavorites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavourite(String productId) {
    return favorites[productId] ?? false;
  }

  void toggleFavoriteProduct(String productId){
    if(!favorites.containsKey(productId)){
      favorites[productId] = true;
      saveFavoritesToStorage();
      MyLoaders.customToast(message: 'Продукт добавлен в Избранное.');
    }else{
      MyLocalStorage.instance().removeData(productId);
      favorites.remove(productId);
      saveFavoritesToStorage();
      favorites.refresh();
      MyLoaders.customToast(message: 'Продукт удалён из Избранного.');
    }
  }

  void saveFavoritesToStorage(){
    final encodedFavorites = json.encode(favorites);
    MyLocalStorage.instance().saveData('favorites', encodedFavorites);
  }

  Future<List<ProductModel>> favoriteProducts() async{
    return await ProductRepository.instance.getFavouriteProducts(favorites.keys.toList());
  }
}