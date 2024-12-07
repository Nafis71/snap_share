import 'package:get/get.dart';

import '../../../core/utilities/routes/routes_names.dart';
import '../../authentication/common/view_model/auth_vm.dart';

class OnBoardingHelper {
  static gotoSignUpView() {
    Get.toNamed(RoutesNames.kSignUpView)?.then((_) {
      Get.find<AuthVM>().resetControllers();
    });
  }

  static gotoSignInView() {
    Get.toNamed(RoutesNames.kSignInView)?.then((_) {
      Get.find<AuthVM>().resetControllers();
    });
  }
}
