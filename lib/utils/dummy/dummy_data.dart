import 'package:flutter/material.dart';
import 'package:sport_shop/features/shop/models/banner_model.dart';
import 'package:sport_shop/features/shop/models/category_model.dart';
import 'package:sport_shop/routes/app_routes.dart';
import 'package:sport_shop/routes/routes.dart';
import 'package:sport_shop/utils/constants/image_strings.dart';

class DummyData{
  static final List<CategoryModel> categories = [
    CategoryModel(id: '1', name: 'Sports', image: MyImages.sportIcon, isFeatured: true),
    CategoryModel(id: '5', name: 'Furniture', image: MyImages.furnitureIcon, isFeatured: true),
    CategoryModel(id: '2', name: 'Clothes', image: MyImages.clothIcon, isFeatured: true),
    CategoryModel(id: '3', name: 'Toys', image: MyImages.toyIcon, isFeatured: true),
    CategoryModel(id: '4', name: 'Shoes', image: MyImages.shoeIcon, isFeatured: true),
    // CategoryModel(id: '6', name: 'Sports', image: MyImages.sportIcon, isFeatured: true),
    // CategoryModel(id: '7', name: 'Sports', image: MyImages.sportIcon, isFeatured: true),
    // CategoryModel(id: '14', name: 'Sports', image: MyImages.sportIcon, isFeatured: true),
  ];
  static final List<BannerModel> banners = [
    BannerModel(imageUrl: 'assets/images/banners/promo-banner-1.png', targetScreen: MyRouts.order, active: true),
    BannerModel(imageUrl: 'assets/images/banners/promo-banner-2.png', targetScreen: MyRouts.settings, active: true),
    BannerModel(imageUrl: 'assets/images/banners/promo-banner-3.png', targetScreen: MyRouts.cart, active: true),
  ];
}