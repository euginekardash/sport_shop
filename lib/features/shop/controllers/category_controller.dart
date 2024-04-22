import 'package:get/get.dart';
import 'package:sport_shop/data/repositories/categories/category_repository.dart';
import 'package:sport_shop/data/repositories/product/product_repository.dart';
import 'package:sport_shop/features/shop/models/category_model.dart';
import 'package:sport_shop/features/shop/models/product_model.dart';
import 'package:sport_shop/utils/popups/loaders.dart';

class CategoryController extends GetxController{
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories() async{
    try{

      isLoading.value = true;

      final categories = await _categoryRepository.getAllCategories();

      allCategories.assignAll(categories); //update categories list

      //filter
      featuredCategories.assignAll(allCategories.where((category) => category.isFeatured && category.parentId.isEmpty).take(8).toList());

    }catch(e){
      MyLoaders.errorSnackBar(title: 'Ошибка!', message: e.toString());
    } finally{
      isLoading.value = false;
    }
  }

  Future<List<CategoryModel>> getSubCategories(String categoryId) async{
    try{

      final subCategories = await _categoryRepository.getSubCategories(categoryId);
      return subCategories;

    }catch(e){
      MyLoaders.errorSnackBar(title: 'Ошибка', message: e.toString());
      return[];
    }
  }

  Future<List<ProductModel>> getCategoryProducts({required String categoryId, int limit = 4}) async{
    try{
      final products = await ProductRepository.instance.getProductsForCategory(categoryId: categoryId, limit: limit);
      return products;
    }
    catch(e){
      MyLoaders.errorSnackBar(title: 'Ошибка', message: e.toString());
      return[];
    }
  }
}