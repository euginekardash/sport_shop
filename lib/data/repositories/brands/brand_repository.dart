import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sport_shop/features/shop/models/brand_model.dart';

import '../../../common/widgets/firebase/firebase_storage_service.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class BrandRepository extends GetxController{
  static BrandRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<BrandModel>> getAllBrands()async{
    try{

      final snapshot = await _db.collection('Brands').get();
      final result = snapshot.docs.map((e) => BrandModel.fromSnapshot(e)).toList();
      return result;

    }on FirebaseException catch(e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch(e) {
      throw TPlatformException(e.code).message;
    } on FormatException catch(_){
      throw const TFormatException();
    }
    catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<List<BrandModel>> getBrandsForCategory(String categoryId)async{
    try{

      QuerySnapshot brandCategoryQuery = await _db.collection('BrandCategory').where('categoryId', isEqualTo: categoryId).get();

      List<String> brandIds = brandCategoryQuery.docs.map((doc) => doc['brandId'] as String).toList();

      final brandsQuery = await _db.collection('Brands').where(FieldPath.documentId, whereIn: brandIds).limit(2).get();

      List<BrandModel> brands = brandsQuery.docs.map((doc) => BrandModel.fromSnapshot(doc)).toList();

      return brands;

    }on FirebaseException catch(e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch(e) {
      throw TPlatformException(e.code).message;
    } on FormatException catch(_){
      throw const TFormatException();
    }
    catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<void> uploadDummyData(List<BrandModel> brands) async{
    try{
      final storage = Get.put(FirebaseStorageService());

      for(var brand in brands){
        final file = await storage.getImageDataFromAssets(brand.image);

        final url = await storage.uploadImageData('Brands', file, brand.name);

        brand.image = url;

        await _db.collection("Brands").doc(brand.id).set(brand.toJson());
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