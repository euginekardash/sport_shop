import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_shop/data/repositories/product/product_repository.dart';
import 'package:sport_shop/features/shop/models/brand_model.dart';
import 'package:sport_shop/features/shop/models/product_model.dart';
import 'package:sport_shop/utils/constants/enums.dart';
import 'package:sport_shop/utils/popups/loaders.dart';

import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popups/full_screen_loader.dart';

class ProductController extends GetxController{
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  final productRepository = Get.put(ProductRepository());
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }



  void fetchFeaturedProducts() async{
    try{
      isLoading.value = true;

      final products = await productRepository.getFeaturedProducts();

      featuredProducts.assignAll(products);
    }catch(e){
      MyLoaders.errorSnackBar(title: 'Oh snap', message: e.toString());
    }finally{
      isLoading.value = false;
    }
  }

  Future<List<ProductModel>> fetchAllFeaturedProducts() async{
    try{

      final products = await productRepository.getAllFeaturedProducts();
      return products;
    }catch(e){
      MyLoaders.errorSnackBar(title: 'Oh snap', message: e.toString());
      return [];
    }
  }

  String getProductPrice(ProductModel product){
    double smallerPrice = double.infinity;
    double largestPrice = 0.0;

    if(product.productType == ProductType.single.toString()){
      return (product.salePrice > 0 ? product.salePrice : product.price).toString();
    } else{
      for(var variation in product.productVariations!){
        double priceToConsider = variation.salePrice > 0.0 ? variation.salePrice : variation.price;

        if(priceToConsider < smallerPrice){
          smallerPrice = priceToConsider;
        }
        if(priceToConsider > largestPrice){
          largestPrice = priceToConsider;
        }
      }
      if(smallerPrice.isEqual(largestPrice)) {
        return largestPrice.toString();
      } else{
        return '$smallerPrice - $largestPrice';
      }
    }
  }

  String? calculateSalePercentage(double originalPrice, double? salePrice){
    if(salePrice == null || salePrice <= 0.0) return null;
    if(originalPrice <= 0) return null;

    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  String getProductStockStatus(int stock){
    return stock > 0 ? 'In Stock' : 'Out of Stock';
  }


}