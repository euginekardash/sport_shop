import 'package:get/get.dart';
import 'package:sport_shop/data/repositories/categories/category_repository.dart';
import 'package:sport_shop/features/shop/models/category_model.dart';
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
      featuredCategories.assignAll(allCategories.where((category) => category.isFeatured && category.parentId.isEmpty));

    }catch(e){
      MyLoaders.errorSnackBar(title: 'Oh snap', message: e.toString());
    } finally{
      isLoading.value = false;
    }
  }
}