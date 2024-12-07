import 'package:get/get.dart';
import 'package:snap_share/core/utilities/exports/route_export.dart';
import 'package:snap_share/features/authentication/common/view_model/auth_vm.dart';
import 'package:snap_share/features/authentication/login/utilities/constants/login_strings.dart';

import '../../../../../core/wrappers/snackbar_notification.dart';

class LoginHelper {
  static Future<void> login() async {
    AuthVM authVM = Get.find();
    (bool, String) status = await authVM.signIn();
    if (status.$1) {
      Get.offAllNamed(RoutesNames.kMainBottomNavView);
    } else {
      showSnackBarNotification(
        title: LoginStrings.kLoginFailureTitleTxt,
        message: status.$2.toString(),
        isError: true,
      );
    }
  }
}
