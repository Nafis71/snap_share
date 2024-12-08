import 'package:get_storage/get_storage.dart';

class AppStorage {
  AppStorage._();

  static AppStorage? _instance;
  late GetStorage appStorage;

  factory AppStorage() => _instance ??= AppStorage._();

  Future<void> init() async {
    await GetStorage.init();
    appStorage = GetStorage();
  }

  dynamic read(String key) {
    return appStorage.read(key);
  }

  Future<void> write(String key, dynamic value) async {
    await appStorage.write(key, value);
  }

  void eraseStorage() {
    appStorage.erase();
  }

  Future<void> removeKey(String key) async {
    await appStorage.remove(key);
  }
}
