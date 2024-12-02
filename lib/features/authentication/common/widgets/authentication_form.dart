import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:snap_share/core/utilities/exports/widget_export.dart';
import 'package:snap_share/features/authentication/common/view_model/auth_vm.dart';

class AuthenticationForm extends StatelessWidget {
  final AuthVM authVM;
  final List<Widget> formFields;
  final String authBtnName;
  final VoidCallback onBtnPressed;

  const AuthenticationForm({
    super.key,
    required this.authVM,
    required this.formFields,
    required this.authBtnName,
    required this.onBtnPressed,
  });

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
            children: formFields,
          ),
          const Gap(42),
          Obx(() {
            return RSizedBox(
              width: 0.8.sw,
              height: 0.09.sw,
              child: ElevatedButton(
                onPressed: authVM.allowAuth.value ? onBtnPressed : null,
                child: (authVM.isAuthenticating.value)
                    ? const ActivityIndicatorCircular()
                    : Text(authBtnName),
              ),
            );
          }),
        ],
      ),
    );
  }
}
