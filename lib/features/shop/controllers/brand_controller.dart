import 'package:get/get.dart';
import 'package:sport_shop/data/repositories/product/product_repository.dart';
import 'package:sport_shop/features/shop/models/brand_model.dart';
import 'package:sport_shop/features/shop/models/product_model.dart';
import 'package:sport_shop/utils/popups/loaders.dart';

import '../../../data/repositories/brands/brand_repository.dart';

class BrandController extends GetxController{
  static BrandController get instance => Get.find();

  RxBool isLoading = true.obs;
  final RxList<BrandModel> allBrands = <BrandModel>[].obs;
  final RxList<BrandModel> featuredBrands = <BrandModel>[].obs;
  final brandRepository = Get.put(BrandRepository());

  @override
  void onInit() {
    getFeaturedBrands();
    super.onInit();
  }

  Future<void> getFeaturedBrands() async{
    try{
      isLoading.value = true;
      
      final brands = await brandRepository.getAllBrands();
      
      allBrands.assignAll(brands);

      featuredBrands.assignAll(allBrands.where((brand) => brand.isFeatured ?? false).take(4));

    }catch(e){
      MyLoaders.errorSnackBar(title: 'Ошибка', message: e.toString());
    }finally{
      isLoading.value = false;
    }
  }

  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async{
    try{
      final brands = await brandRepository.getBrandsForCategory(categoryId);
      return brands;

    }catch(e){
      MyLoaders.errorSnackBar(title: 'Ошибка', message: e.toString());
      return [];
    }
  }

  Future<List<ProductModel>> getBrandProducts({required String brandId, int limit = -1}) async{
    try{
      final products = await ProductRepository.instance.getProductsForBrand(brandId: brandId, limit: limit);
      return products;

    }catch(e){
      MyLoaders.errorSnackBar(title: 'Ошибка', message: e.toString());
      return [];
    }
  }
}