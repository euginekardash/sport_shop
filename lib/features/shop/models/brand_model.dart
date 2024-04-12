import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sport_shop/features/shop/models/brand_model.dart';
import 'package:sport_shop/features/shop/models/product_model.dart';

class BrandModel{
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productsCount;

  BrandModel({required this.id, required this.image, required this.name, this.isFeatured, this.productsCount});

  static BrandModel empty() => BrandModel(id: '', image: '', name: '');

  toJson(){
    return {
      'Id': id,
      'Name': name,
      'Image': image,
      'ProductCount': productsCount,
      'IsFeatured': isFeatured,
    };
  }

  factory BrandModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if(data.isEmpty) return BrandModel.empty();
    return BrandModel(
        id: data['Id'] ?? '',
        name: data['Name'] ?? '',
        image: data['Image'] ?? '',
        isFeatured: data['IsFeatured'] ?? false,
      productsCount: int.parse((data['ProductCount'] ?? 0).toString()),
    );
  }


}