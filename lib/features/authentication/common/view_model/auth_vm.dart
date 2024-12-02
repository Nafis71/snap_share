import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snap_share/core/services/app_storage.dart';
import 'package:snap_share/core/utilities/exports/resource_export.dart';

class AuthVM extends GetxController {
  final Rx<GlobalKey<FormState>> _formKey = GlobalKey<FormState>().obs;
  final Rx<TextEditingController> _emailTEController =
      TextEditingController().obs;
  final Rx<TextEditingController> _passwordTEController =
      TextEditingController().obs;
  final Rx<TextEditingController> _confirmPasswordTEController =
      TextEditingController().obs;
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode confirmPasswordFocusNode = FocusNode();
  Rx<bool> allowAuth = false.obs;
  Rx<bool> allowForSignUp = false.obs;
  Rx<bool> savePassword = false.obs;
  Rx<bool> isAuthenticating = false.obs;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Rx<TextEditingController> get emailTEController => _emailTEController;

  Rx<TextEditingController> get passwordTEController => _passwordTEController;

  Rx<TextEditingController> get confirmPasswordTEController =>
      _confirmPasswordTEController;

  GlobalKey<FormState> get formKey => _formKey.value;

  void updateAuthState() {
    allowAuth.value = _emailTEController.value.text.isNotEmpty &&
        _passwordTEController.value.text.isNotEmpty &&
        _validateForm() == true;
  }

  bool _validateForm() {
    return _formKey.value.currentState?.validate() ?? false;
  }

  Future<(bool, String)> signUp() async {
    return authenticate(
      () async {
        await firebaseAuth.createUserWithEmailAndPassword(
          email: _emailTEController.value.text.trim(),
          password: _passwordTEController.value.text.trim(),
        );
        await signIn();
      },
    );
  }

  Future<(bool, String)> signIn() async {
    return await authenticate(
      () async {
        UserCredential userCredential =
            await firebaseAuth.signInWithEmailAndPassword(
          email: _emailTEController.value.text.trim(),
          password: _passwordTEController.value.text.trim(),
        );
        if (savePassword.value) storeUserCredentials(userCredential);
      },
    );
  }

  Future<(bool, String)> authenticate(Future<void> Function() callback) async {
    isAuthenticating.value = true;
    bool isSuccess = false;
    String errorMessage = "";
    try {
      await callback();
      isSuccess = true;
    } on FirebaseAuthException catch (exception) {
      errorMessage = exception.message.toString();
    } catch (exception) {
      errorMessage = AppStrings.kUnknownError;
    }
    isAuthenticating.value = false;
    return (isSuccess, errorMessage);
  }

  void storeUserCredentials(UserCredential userCredentials) {
    Map<String, dynamic> credentials = {
      "displayName": userCredentials.user?.displayName.toString(),
      "phoneNumber": userCredentials.user?.phoneNumber.toString(),
      "email": userCredentials.user?.email.toString(),
      "isEmailVerified": userCredentials.user?.emailVerified.toString(),
      "photoUrl": userCredentials.user?.photoURL.toString(),
      "refreshToken": userCredentials.user?.emailVerified.toString(),
      "uId": userCredentials.user?.uid.toString(),
    };
    AppStorage().write("userData", jsonEncode(credentials));
  }

  @override
  void onClose() {
    _emailTEController.value.dispose();
    _passwordTEController.value.dispose();
    _confirmPasswordTEController.value.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    super.onClose();
  }
}
