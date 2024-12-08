import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:snap_share/core/resources/managers/theme_manager.dart';
import 'package:snap_share/core/utilities/exports/resource_export.dart';
import 'package:snap_share/core/utilities/exports/widget_export.dart';
import 'package:snap_share/core/utilities/validators/form_validator.dart';
import 'package:snap_share/features/authentication/common/view_model/auth_vm.dart';
import 'package:snap_share/features/authentication/signup/utilities/constants/sign_up_strings.dart';
import 'package:snap_share/features/authentication/signup/utilities/helpers/sign_up_helper.dart';

import '../../common/widgets/authentication_form.dart';

class SignUpForm extends StatelessWidget {
  final AuthVM authVM;
  final ThemeManager themeManager;

  const SignUpForm({
    super.key,
    required this.authVM,
    required this.themeManager,
  });

  @override
  Widget build(BuildContext context) {
    return AuthenticationForm(
      formKey: authVM.signUpFormKey,
      authBtnName: SignUpStrings.kSignUpBtnText,
      authVM: authVM,
      formFields: [
        _buildHeadingText(
          context,
          SignUpStrings.kEmailTextFieldHeadingTxt,
        ),
        const Gap(8),
        _buildEmailFormField(context),
        const Gap(20),
        _buildHeadingText(
          context,
          SignUpStrings.kPasswordTextFieldHeadingTxt,
        ),
        const Gap(8),
        _buildPasswordFormField(context),
        const Gap(20),
        _buildHeadingText(
          context,
          SignUpStrings.kConfirmPasswordTextFieldHeadingTxt,
        ),
        const Gap(8),
        _buildConfirmPasswordFormField(context)
      ],
      onBtnPressed: SignUpHelper.registerUser,
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
      hintText: SignUpStrings.kEmailTextFieldHintTxt,
      prefixIconPath: IconAssets.kEmailIcon,
      prefixText: SignUpStrings.kTextFieldPrefixText,
      formValidator: (value) {
        return FormValidator.validateEmail(value);
      },
      onFieldSubmitted: (value) {
        FocusScope.of(context).requestFocus(authVM.passwordFocusNode);
      },
      onChanged: (value) {
        authVM.updateAuthState(FormKey.signUpFormKey);
      },
      isDark: themeManager.isDarkMode(context),
    );
  }

  Widget _buildPasswordFormField(BuildContext context) {
    return CustomTextField(
      controller: authVM.passwordTEController,
      focusNode: authVM.passwordFocusNode,
      hintText: SignUpStrings.kPasswordTextFieldHintTxt,
      isPassword: true,
      prefixIconPath: IconAssets.kPasswordIcon,
      prefixText: SignUpStrings.kTextFieldPrefixText,
      suffixIcon: Icons.visibility_outlined,
      alternateSuffixIcon: Icons.visibility_off_outlined,
      formValidator: (value) {
        return FormValidator.validatePassword(value);
      },
      onFieldSubmitted: (value) {
        if (authVM.confirmPasswordTEController.value.text.isEmpty) {
          FocusScope.of(context).requestFocus(authVM.confirmPasswordFocusNode);
        }
      },
      onChanged: (value) {
        authVM.updateAuthState(FormKey.signUpFormKey);
      },
      isDark: themeManager.isDarkMode(context),
    );
  }

  Widget _buildConfirmPasswordFormField(BuildContext context) {
    return CustomTextField(
      controller: authVM.confirmPasswordTEController,
      focusNode: authVM.confirmPasswordFocusNode,
      hintText: SignUpStrings.kConfirmPasswordTextFieldHeadingTxt,
      isPassword: true,
      prefixIconPath: IconAssets.kPasswordIcon,
      prefixText: SignUpStrings.kTextFieldPrefixText,
      suffixIcon: Icons.visibility_outlined,
      alternateSuffixIcon: Icons.visibility_off_outlined,
      formValidator: (value) {
        return FormValidator.validateConfirmPassword(
          value,
          authVM.passwordTEController.text,
        );
      },
      onFieldSubmitted: (value) {
        if (authVM.emailTEController.value.text.isEmpty) {
          FocusScope.of(context).requestFocus(authVM.emailFocusNode);
        }
      },
      onChanged: (value) {
        authVM.updateAuthState(FormKey.signUpFormKey);
      },
      isDark: themeManager.isDarkMode(context),
    );
  }
}
