import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:snap_share/core/resources/managers/theme_manager.dart';
import 'package:snap_share/features/authentication/common/view_model/auth_vm.dart';

import '../../../features/authentication/common/services/auth_service.dart';
import '../../../features/main_bottom_nav/view_model/main_bottom_nav_vm.dart';
import '../../../features/onboarding/view_model/onboarding_vm.dart';

class DependencyInjection {
  static void init() {
    Get.put<ThemeManager>(ThemeManager(), permanent: true);
    Get.lazyPut<OnboardingVM>(() => OnboardingVM(), fenix: true);
    Get.lazyPut<MainBottomNavVM>(() => MainBottomNavVM(), fenix: true);
    Get.lazyPut<AuthVM>(
      () => AuthVM(AuthService(FirebaseAuth.instance)),
      fenix: true,
    );
  }
}
