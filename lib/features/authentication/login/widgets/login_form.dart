import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:snap_share/core/resources/managers/theme_manager.dart';
import 'package:snap_share/core/utilities/exports/resource_export.dart';
import 'package:snap_share/core/utilities/exports/widget_export.dart';
import 'package:snap_share/core/utilities/exports/wrapper_export.dart';
import 'package:snap_share/core/utilities/validators/form_validator.dart';
import 'package:snap_share/features/authentication/common/view_model/auth_vm.dart';
import 'package:snap_share/features/authentication/login/utilities/login_strings.dart';

import '../../common/widgets/authentication_form.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        AuthVM authVM = Get.find();
        ThemeManager themeManager = Get.find();
        return AuthenticationForm(
          authVM: authVM,
          textFields: [
            Text(
              LoginStrings.kEmailTextFieldHeadingTxt,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const Gap(8),
            CustomTextField(
              controller: authVM.emailTEController.value,
              hintText: LoginStrings.kEmailTextFieldHintTxt,
              prefixWidget: SvgLoader(
                asset: IconAssets.kEmailIcon,
                color: (themeManager.getTheme(context) == Brightness.dark)
                    ? DarkThemeColors.kTxtFieldPrefixIconColor
                    : null,
              ),
              prefixText: LoginStrings.kTextFieldPrefixText,
              onChanged: (value) {
                authVM.listenTextEditors();
              },
              formValidator: (value) {
                return FormValidator.validateEmail(value);
              },
            ),
            const Gap(20),
            Text(
              LoginStrings.kPasswordTextFieldHeadingTxt,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const Gap(8),
            CustomTextField(
              controller: authVM.passwordTEController.value,
              hintText: LoginStrings.kPasswordTextFieldHintTxt,
              isPassword: true,
              prefixWidget: SvgLoader(
                asset: IconAssets.kPasswordIcon,
                color: (themeManager.getTheme(context) == Brightness.dark)
                    ? DarkThemeColors.kTxtFieldPrefixIconColor
                    : null,
              ),
              prefixText: LoginStrings.kTextFieldPrefixText,
              suffixWidget: Icon(
                Icons.visibility_outlined,
                size: 25,
                color: (themeManager.getTheme(context) == Brightness.dark)
                    ? DarkThemeColors.kTxtFieldSuffixIconColor
                    : null,
              ),
              alternateSuffixWidget: const Icon(
                Icons.visibility_off_outlined,
                size: 25,
                color: AppColors.kPrimaryColor,
              ),
              onChanged: (value) {
                authVM.listenTextEditors();
              },
              formValidator: (value) {
                return FormValidator.validatePassword(value);
              },
            ),
            const Gap(8),
            Row(
              children: [
                Obx(
                  () => RSizedBox(
                    width: 15.w,
                    child: Checkbox(
                      value: authVM.savePassword.value,
                      onChanged: (value) {
                        authVM.savePassword.toggle();
                      },
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
                ),
                const Gap(5),
                Text(
                  LoginStrings.kSavePasswordCheckBoxTxt,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 10.sp, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
