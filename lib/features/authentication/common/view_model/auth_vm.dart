import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snap_share/core/services/app_storage.dart';
import 'package:snap_share/core/utilities/exports/resource_export.dart';
import 'package:snap_share/features/authentication/common/services/auth_service.dart';

enum FormKey { signInFormKey, signUpFormKey }

class AuthVM extends GetxController {
  final GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _signInFormKey = GlobalKey<FormState>();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _confirmPasswordTEController =
      TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode confirmPasswordFocusNode = FocusNode();
  Rx<bool> allowAuth = false.obs;
  Rx<bool> savePassword = false.obs;
  Rx<bool> isAuthenticating = false.obs;
  final AuthService _authService;

  AuthVM(AuthService authService) : _authService = authService;

  TextEditingController get emailTEController => _emailTEController;

  TextEditingController get passwordTEController => _passwordTEController;

  TextEditingController get confirmPasswordTEController =>
      _confirmPasswordTEController;

  GlobalKey<FormState> get signUpFormKey => _signUpFormKey;

  GlobalKey<FormState> get signInFormKey => _signInFormKey;

  void updateAuthState(FormKey formKey) {
    switch (formKey) {
      case FormKey.signInFormKey:
        allowAuth.value = _emailTEController.value.text.isNotEmpty &&
            _passwordTEController.text.isNotEmpty &&
            _validateForm(formKey) == true;
      case FormKey.signUpFormKey:
        allowAuth.value = _emailTEController.value.text.isNotEmpty &&
            _passwordTEController.text.isNotEmpty &&
            _confirmPasswordTEController.text.isNotEmpty &&
            _validateForm(formKey) == true;
    }
  }

  bool _validateForm(FormKey formKey) {
    switch (formKey) {
      case FormKey.signInFormKey:
        return _signInFormKey.currentState?.validate() ?? false;
      case FormKey.signUpFormKey:
        return _signUpFormKey.currentState?.validate() ?? false;
    }
  }

  Future<(bool, String)> signUp() async {
    return authenticate(
      () async {
        await _authService.signUp(
          _emailTEController.text,
          _passwordTEController.text,
        );
        return true;
      },
    );
  }

  Future<(bool, String)> signIn() async {
    return await authenticate(
      () async {
        UserCredential userCredential = await _authService.signIn(
          _emailTEController.text,
          _passwordTEController.text,
        );
        if (savePassword.value) await storeUserCredentials(userCredential);
        return true;
      },
    );
  }

  Future<(bool, String)> authenticate(Future<bool> Function() callback) async {
    isAuthenticating.toggle();
    bool isSuccess = false;
    String errorMessage = "";
    try {
      isSuccess = await callback();
    } on FirebaseAuthException catch (exception) {
      errorMessage = exception.message.toString();
    } catch (exception) {
      errorMessage = AppStrings.kUnknownError;
    }
    isAuthenticating.toggle();
    return (isSuccess, errorMessage);
  }

  Future<void> storeUserCredentials(UserCredential userCredentials) async {
    Map<String, dynamic> userModel = createUserModel(userCredentials);
    await AppStorage().write("userData", jsonEncode(userModel));
  }

  Map<String, dynamic> createUserModel(UserCredential userCredentials) {
    return {
      "displayName": userCredentials.user?.displayName,
      "phoneNumber": userCredentials.user?.phoneNumber,
      "email": userCredentials.user?.email,
      "isEmailVerified": userCredentials.user?.emailVerified,
      "photoUrl": userCredentials.user?.photoURL,
      "refreshToken": userCredentials.user?.refreshToken,
      "uId": userCredentials.user?.uid,
    };
  }

  void resetControllers() {
    _emailTEController.clear();
    _passwordTEController.clear();
    _confirmPasswordTEController.clear();
    savePassword.value = false;
    allowAuth.value = false;
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _passwordTEController.dispose();
    _confirmPasswordTEController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    super.dispose();
  }
}
