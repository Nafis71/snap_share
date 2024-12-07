import 'package:get/get.dart';
import 'package:snap_share/core/utilities/exports/route_export.dart';
import 'package:snap_share/core/wrappers/snackbar_notification.dart';
import 'package:snap_share/features/authentication/common/view_model/auth_vm.dart';
import 'package:snap_share/features/authentication/signup/utilities/constants/sign_up_strings.dart';

class SignUpHelper {
  static Future<void> registerUser() async {
    AuthVM authVM = Get.find();
    (bool, String) status = await authVM.signUp();
    if (status.$1) {
      showSnackBarNotification(
        title: SignUpStrings.kSignUpSuccessTitleTxt,
        message: SignUpStrings.kSignUpSuccessMessageTxt,
        isError: false,
      );
      Get.offNamed(RoutesNames.kSignInView);
    } else {
      showSnackBarNotification(
        title: SignUpStrings.kSignUpFailureTitleTxt,
        message: status.$2.toString(),
        isError: true,
      );
    }
  }
}
