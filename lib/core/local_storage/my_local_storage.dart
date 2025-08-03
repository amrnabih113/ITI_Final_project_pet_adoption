import 'package:get_storage/get_storage.dart';

class MyLocalStorage {
  late final GetStorage _storage;

  static MyLocalStorage? _instance;

  MyLocalStorage._internal(String bucketName) {
    _storage = GetStorage(bucketName); // Ensure initialization
  }

  factory MyLocalStorage.instance() {
    if (_instance == null) {
      throw Exception("MyLocalStorage is not initialized. Call init() first.");
    }
    return _instance!;
  }

  static Future<void> init(String bucketName) async {
    await GetStorage.init(bucketName);
    _instance = MyLocalStorage._internal(bucketName);
  }

  Future<void> saveData<T>(String key, T value) async {
    await _storage.write(key, value);
  }

  T? readData<T>(String key) {
    return _storage.read<T>(key);
  }

  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

  Future<void> clearAll() async {
    await _storage.erase();
  }
}
