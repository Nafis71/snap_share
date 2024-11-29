import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:snap_share/core/resources/managers/theme_manager.dart';
import 'package:snap_share/core/utilities/exports/resource_export.dart';
import 'package:snap_share/core/utilities/exports/widget_export.dart';
import 'package:snap_share/core/utilities/exports/wrapper_export.dart';
import 'package:snap_share/core/utilities/validators/form_validator.dart';
import 'package:snap_share/features/authentication/common/view_model/auth_vm.dart';
import 'package:snap_share/features/authentication/login/utilities/login_strings.dart';
import 'package:snap_share/features/authentication/login/widgets/save_password_checkbox.dart';

import '../../common/widgets/authentication_form.dart';

class LoginForm extends StatelessWidget {
  final AuthVM authVM;
  final ThemeManager themeManager;

  const LoginForm(
      {super.key, required this.authVM, required this.themeManager});

  @override
  Widget build(BuildContext context) {
    return AuthenticationForm(
      authVM: authVM,
      formFields: [
        _buildHeadingText(
          context,
          LoginStrings.kEmailTextFieldHeadingTxt,
        ),
        const Gap(8),
        Obx(
          () => _buildEmailFormField(context),
        ),
        const Gap(20),
        _buildHeadingText(
          context,
          LoginStrings.kPasswordTextFieldHeadingTxt,
        ),
        const Gap(8),
        Obx(
          () => _buildPasswordFormField(context),
        ),
        const Gap(8),
        SavePasswordCheckbox(authVM: authVM),
      ],
    );
  }

  Widget _buildHeadingText(BuildContext context, String text) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(fontWeight: FontWeight.bold),
    );
  }

  Widget _buildEmailFormField(BuildContext context) {
    return CustomTextField(
      controller: authVM.emailTEController.value,
      focusNode: authVM.emailFocusNode,
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
      onFieldSubmitted: (value) {
        FocusScope.of(context).requestFocus(authVM.passwordFocusNode);
      },
    );
  }

  Widget _buildPasswordFormField(BuildContext context) {
    return CustomTextField(
      controller: authVM.passwordTEController.value,
      focusNode: authVM.passwordFocusNode,
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
      onFieldSubmitted: (value) {
        if (authVM.emailTEController.value.text.isEmpty) {
          FocusScope.of(context).requestFocus(authVM.emailFocusNode);
        }
      },
    );
  }
}
