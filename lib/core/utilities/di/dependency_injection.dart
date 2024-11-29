import 'package:get/get.dart';
import 'package:snap_share/core/resources/managers/theme_manager.dart';

import '../../../features/onboarding/view_model/onboarding_vm.dart';

class DependencyInjection {
  static void init() {
    Get.put<ThemeManager>(ThemeManager(), permanent: true);
    Get.lazyPut<OnboardingVM>(() => OnboardingVM(), fenix: true);
  }
}
