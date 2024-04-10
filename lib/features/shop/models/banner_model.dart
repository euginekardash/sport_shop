import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sport_shop/features/shop/models/banner_model.dart';

class BannerModel {
  String imageUrl;
  final String targetScreen;
  final bool active;

  BannerModel({required this.imageUrl, required this.targetScreen, required this.active});

  Map<String, dynamic> toJson(){
    return {
      'ImageUrl': imageUrl,
      'TargetScreen': targetScreen,
      'Active': active,
    };
  }

  factory BannerModel.fromSnapshot(DocumentSnapshot snapshot){
    final data = snapshot.data() as Map<String, dynamic>;
    return BannerModel(
        imageUrl: data['ImageUrl'] ?? '',
        targetScreen: data['TargetScreen'] ?? '',
        active: data['Active'] ?? false,
    );
  }
}
