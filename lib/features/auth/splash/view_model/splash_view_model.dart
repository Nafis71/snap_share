import 'package:get/get.dart';
import 'package:snap_share/export_file.dart';

class SplashViewModel extends GetxController {
  Future<void> moveToOnboarding() async {
    Future.delayed(
      const Duration(seconds: 2),
      () => Get.offAllNamed(RoutesNames.onboardingView),
    );
  }
}
