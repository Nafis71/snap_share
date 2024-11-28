import 'package:get/get.dart';

import '../../../features/onboarding/view_model/onboarding_vm.dart';

class DependencyInjection {
  static void init() {
    Get.lazyPut(() => OnboardingVM(), fenix: true);
  }
}
