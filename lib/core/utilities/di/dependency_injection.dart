import 'package:get/get.dart';
import '../../../features/splash/view_model/splash_vm.dart';

class DependencyInjection{
  static void init() {
    Get.lazyPut(() => SplashViewModel(), fenix: true);
  }
}
