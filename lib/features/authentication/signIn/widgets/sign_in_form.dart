import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:snap_share/core/resources/managers/theme_manager.dart';
import 'package:snap_share/core/utilities/exports/resource_export.dart';
import 'package:snap_share/core/utilities/exports/widget_export.dart';
import 'package:snap_share/core/utilities/validators/form_validator.dart';
import 'package:snap_share/features/authentication/common/view_model/auth_vm.dart';
import 'package:snap_share/features/authentication/common/widgets/save_password_checkbox.dart';
import 'package:snap_share/features/authentication/signIn/utilities/constants/login_strings.dart';

import '../../common/widgets/authentication_form.dart';
import '../utilities/helpers/login_helper.dart';

class SignInForm extends StatelessWidget {
  final AuthVM authVM;
  final ThemeManager themeManager;

  const SignInForm({
    super.key,
    required this.authVM,
    required this.themeManager,
  });

  @override
  Widget build(BuildContext context) {
    return AuthenticationForm(
      formKey: authVM.signInFormKey,
      authBtnName: SignInStrings.kLoginBtnText,
      authVM: authVM,
      formFields: [
        _buildHeadingText(
          context,
          SignInStrings.kEmailTextFieldHeadingTxt,
        ),
        const Gap(8),
        _buildEmailFormField(context),
        const Gap(20),
        _buildHeadingText(
          context,
          SignInStrings.kPasswordTextFieldHeadingTxt,
        ),
        const Gap(8),
        _buildPasswordFormField(context),
        const Gap(8),
        SavePasswordCheckbox(authVM: authVM),
      ],
      onBtnPressed: SignInHelper.login,
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
      controller: authVM.emailTEController,
      focusNode: authVM.emailFocusNode,
      hintText: SignInStrings.kEmailTextFieldHintTxt,
      prefixIconPath: IconAssets.kEmailIcon,
      prefixText: SignInStrings.kTextFieldPrefixText,
      formValidator: (value) {
        return FormValidator.validateEmail(value);
      },
      onFieldSubmitted: (value) {
        FocusScope.of(context).requestFocus(authVM.passwordFocusNode);
      },
      onChanged: (value) {
        authVM.updateAuthState(FormKey.signInFormKey);
      },
      isDark: themeManager.isDarkMode(context),
    );
  }

  Widget _buildPasswordFormField(BuildContext context) {
    return CustomTextField(
      controller: authVM.passwordTEController,
      focusNode: authVM.passwordFocusNode,
      hintText: SignInStrings.kPasswordTextFieldHintTxt,
      isPassword: true,
      prefixIconPath: IconAssets.kPasswordIcon,
      prefixText: SignInStrings.kTextFieldPrefixText,
      suffixIcon: Icons.visibility_outlined,
      alternateSuffixIcon: Icons.visibility_off_outlined,
      formValidator: (value) {
        return FormValidator.validatePassword(value);
      },
      onFieldSubmitted: (value) {
        if (authVM.emailTEController.value.text.isEmpty) {
          FocusScope.of(context).requestFocus(authVM.emailFocusNode);
        }
      },
      onChanged: (value) {
        authVM.updateAuthState(FormKey.signInFormKey);
      },
      isDark: themeManager.isDarkMode(context),
    );
  }
}
