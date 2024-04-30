import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:sport_shop/data/repositories/product/product_repository.dart';
import 'package:sport_shop/features/shop/models/product_model.dart';
import 'package:sport_shop/utils/popups/loaders.dart';

class AllProductsController extends GetxController{
  static AllProductsController get instance => Get.find();

  final repository = ProductRepository.instance;
  final RxString selectedSortOption = 'Название'.obs;
  final RxList<ProductModel> products = <ProductModel>[].obs;

  Future<List<ProductModel>> fetchProductsByQuery(Query? query)async{
    try{
      if(query == null){ return [];}

      final products = await repository.fetchProductsByQuery(query);

      return products;

    }catch(e){
      MyLoaders.errorSnackBar(title: 'Oh snap', message: e.toString());
      return[];
    }
  }

  void sortProducts (String sortOption){
    selectedSortOption.value = sortOption;

    switch(sortOption){
      case 'Название' :
        products.sort((a, b) => a.title.compareTo(b.title));
        break;
      case 'Высокая цена' :
        products.sort((a, b) => b.price.compareTo(a.price));
        break;
      case 'Низкая цена' :
        products.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'Скидка' :
        products.sort((a, b) {
          if(b.salePrice > 0){
            return b.salePrice.compareTo(a.salePrice);
          } else if(a.salePrice > 0){
            return -1;
          } else {
            return 1;
          }
        });
        break;
        default:
          products.sort((a, b) => a.title.compareTo(b.title));
    }
  }

  void assignProducts(List<ProductModel> products){
    this.products.assignAll(products);
    sortProducts('Название');
  }
}