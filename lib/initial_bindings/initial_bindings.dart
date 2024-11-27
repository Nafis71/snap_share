import 'package:get/get.dart';
import 'package:snap_share/export_file.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    SplashBinding().dependencies();
  }
}
