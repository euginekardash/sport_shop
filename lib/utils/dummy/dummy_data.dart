import 'package:flutter/material.dart';
import 'package:sport_shop/features/shop/models/banner_model.dart';
import 'package:sport_shop/features/shop/models/brand_model.dart';
import 'package:sport_shop/features/shop/models/category_model.dart';
import 'package:sport_shop/features/shop/models/product_attribute_model.dart';
import 'package:sport_shop/features/shop/models/product_model.dart';
import 'package:sport_shop/features/shop/models/product_variation_model.dart';
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
  static final List<ProductModel> products = [
    ProductModel(
        id: '001',
        title: 'Green Nike sports shoe',
        stock: 15,
        price: 135,
        isFeatured: true,
        thumbnail: MyImages.productImage1,
        description: 'Green Nike sports shoe',
        brand: BrandModel(id: '1', image: 'assets/icons/brands/nike.png', name: 'Nike', productsCount: 265, isFeatured: true),
        images: [MyImages.productImage1, MyImages.productImage8],
        salePrice: 30,
        sku: 'ABR4568',
        categoryId: '1',
        productAttributes: [
          ProductAttributeModel(name: 'Color', values: ['Green', 'Black', 'Red']),
          ProductAttributeModel(name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
        ],
        productVariations: [
          ProductVariationModel(
          id: '1',
          stock: 34,
          price: 134,
          salePrice: 122.6,
          image: MyImages.productImage1,
          description: 'This is desk for green nike shoe',
          attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
          ProductVariationModel(
          id: '2',
          stock: 15,
          price: 132,
          image: MyImages.productImage8,
          description: 'This is desk for green nike shoe',
          attributeValues: {'Color': 'Black', 'Size': 'EU 32'}),
        ],
        productType: 'ProductType.variable',
    ),
  ];
}