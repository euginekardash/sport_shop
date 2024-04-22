

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sport_shop/common/widgets/firebase/firebase_storage_service.dart';
import 'package:sport_shop/features/shop/models/category_model.dart';
import 'package:sport_shop/utils/exceptions/firebase_exceptions.dart';
import 'package:sport_shop/utils/exceptions/format_exceptions.dart';
import 'package:sport_shop/utils/exceptions/platform_exceptions.dart';

class CategoryRepository extends GetxController{
  static CategoryRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<CategoryModel>> getAllCategories() async{
    try{
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs.map((document) => CategoryModel.fromSnapshot(document)).toList();
      return list;
    }on FirebaseException catch(e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch(e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<List<CategoryModel>> getSubCategories(String categoryId) async{
    try{

      final snapshot = await _db.collection('Categories').where('ParentId', isEqualTo: categoryId).get();
      final result = snapshot.docs.map((e) => CategoryModel.fromSnapshot(e)).toList();
      return result;

    }on FirebaseException catch(e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch(e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<void> uploadDummyData(List<CategoryModel> categories) async{
    try{
      final storage = Get.put(FirebaseStorageService());

      for(var category in categories){
        final file = await storage.getImageDataFromAssets(category.image);

        final url = await storage.uploadImageData('Categories', file, category.name);

        category.image = url;

        await _db.collection("Categories").doc(category.id).set(category.toJson());
      }
    }on FirebaseException catch(e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch(e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}