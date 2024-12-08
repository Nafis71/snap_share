import 'package:get/get.dart';
import 'package:snap_share/core/services/app_storage.dart';
import 'package:snap_share/core/utilities/exports/route_export.dart';
import 'package:snap_share/core/wrappers/logger.dart';

class SplashHelper {
  static void gotoOnboard() {
    logger.d(AppStorage().read("userData"));
    Get.offNamed(RoutesNames.kOnboardingView);
  }
}
