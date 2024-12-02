import 'package:get_storage/get_storage.dart';

class AppStorage {
  AppStorage._();

  static AppStorage? _instance;
  late final GetStorage appStorage;

  factory AppStorage() => _instance ?? AppStorage._();

  Future<void> init() async {
    await GetStorage.init();
    appStorage = GetStorage();
  }

  dynamic read(String key) {
    appStorage.read(key);
  }

  Future<void> write(String key, dynamic value) async {
    await appStorage.write(key, value);
  }

  void eraseStorage() {
    appStorage.erase();
  }

  void removeKey(String key) {
    appStorage.remove(key);
  }
}
