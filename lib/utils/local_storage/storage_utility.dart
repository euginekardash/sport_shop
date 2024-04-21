import 'package:get_storage/get_storage.dart';

class MyLocalStorage{

  late final GetStorage _storage;

  static MyLocalStorage? _instance;

  MyLocalStorage._internal();

  factory MyLocalStorage.instance() {
    _instance ??= MyLocalStorage._internal();
    return _instance!;
  }

  static Future<void> init(String bucketName) async{
    await GetStorage.init(bucketName);
    _instance = MyLocalStorage._internal();
    _instance!._storage = GetStorage(bucketName);
  }

  Future<void> saveData<T>(String key, T value) async{
    await _storage.write(key, value);
  }

  T? readData<T>(String key){
    return _storage.read<T>(key);
  }

  Future<void> removeData<T>(String key) async{
    await _storage.remove(key);
  }

  Future<void> clearAll<T>() async{
    await _storage.erase();
  }
}