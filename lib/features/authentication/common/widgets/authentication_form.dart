import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:snap_share/features/authentication/common/view_model/auth_vm.dart';
import 'package:snap_share/features/authentication/login/utilities/login_strings.dart';

class AuthenticationForm extends StatelessWidget {
  final AuthVM authVM;
  final List<Widget> textFields;

  const AuthenticationForm(
      {super.key, required this.authVM, required this.textFields});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: authVM.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: textFields,
          ),
          const Gap(42),
          Obx(
            () => Wrap(
              children: [
                RSizedBox(
                  width: 0.8.sw,
                  height: 36.h,
                  child: ElevatedButton(
                    onPressed: (authVM.allowForLogin.value) ? () {} : null,
                    child: const Text(LoginStrings.kLoginBtnText),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
