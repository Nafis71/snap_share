import 'package:get/get.dart';
import 'package:snap_share/export_file.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
