import 'package:get/get.dart';
import 'package:snap_share/export_file.dart';

class Dependency{
  static void init() {
    Get.lazyPut(() => SplashViewModel(), fenix: true);
  }
}
