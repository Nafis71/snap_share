import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:snap_share/core/utilities/exports/route_export.dart';
import 'package:snap_share/features/authentication/common/view_model/auth_vm.dart';

import '../../../../../core/wrappers/snackbar_notification.dart';
import '../constants/login_strings.dart';

class SignInHelper {
  static Future<void> login() async {
    AuthVM authVM = Get.find();
    (bool, String) status = await authVM.signIn();
    if (status.$1) {
      if (authVM.hasUpdatedInfo) {
        Get.offAllNamed(RoutesNames.kMainBottomNavView)?.then((_) {
          authVM.resetController();
        });
      } else {
        Get.offNamed(RoutesNames.kProfileSetupView);
      }
    } else {
      showSnackBarNotification(
        title: SignInStrings.kLoginFailureTitleTxt,
        message: status.$2.toString(),
        isError: true,
      );
    }
  }
}
