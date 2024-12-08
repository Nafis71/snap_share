import 'dart:convert';

import 'package:get/get.dart';
import 'package:snap_share/core/utilities/exports/route_export.dart';
import 'package:snap_share/features/common/services/app_storage.dart';

class SplashHelper {
  static void gotoOnboard() {
    String? userData = AppStorage().read("userData");
    bool? savePassword = AppStorage().read("savePassword");
    if (userData != null && savePassword != null) {
      Map<String, dynamic> json = jsonDecode(userData);
      if (json['hasUpdatedInfo'] && savePassword) {
        Get.offNamed(RoutesNames.kMainBottomNavView);
      } else {
        Get.offNamed(RoutesNames.kOnboardingView);
      }
      return;
    }
    Get.offNamed(RoutesNames.kOnboardingView);
  }
}
