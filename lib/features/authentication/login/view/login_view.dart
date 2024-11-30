import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:snap_share/core/resources/managers/theme_manager.dart';
import 'package:snap_share/core/utilities/exports/resource_export.dart';
import 'package:snap_share/core/utilities/exports/widget_export.dart';
import 'package:snap_share/features/authentication/common/view_model/auth_vm.dart';
import 'package:snap_share/features/authentication/login/utilities/login_strings.dart';
import 'package:snap_share/features/authentication/login/widgets/login_form.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(),
      body: SafeArea(
        child: RPadding(
          padding: EdgeInsets.all(Paddings.kScreenAllPadding).w,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    LoginStrings.kLoginViewHeadingTxt,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const Gap(42),
                  LoginForm(
                    authVM: Get.find<AuthVM>(),
                    themeManager: Get.find<ThemeManager>(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
