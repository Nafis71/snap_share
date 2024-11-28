import 'package:get/get.dart';
import 'package:snap_share/core/utilities/exports/route_export.dart';

class SplashHelper {
  static void moveToOnboard() {
    Get.offNamed(RoutesNames.kOnboardingView);
  }
}
