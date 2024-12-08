import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snap_share/core/utilities/exports/resource_export.dart';
import 'package:snap_share/core/wrappers/logger.dart';
import 'package:snap_share/features/authentication/common/services/auth_service.dart';
import 'package:snap_share/features/common/services/app_storage.dart';
import 'package:snap_share/features/common/view_model/profile_vm.dart';

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
  bool hasUpdatedInfo = false;
  final AuthService _authService;
  final ProfileVM _profileVM;

  AuthVM(AuthService authService, ProfileVM profileVM) //dependency injection
      : _authService = authService,
        _profileVM = profileVM;

  TextEditingController get emailTEController => _emailTEController;

  TextEditingController get passwordTEController => _passwordTEController;

  TextEditingController get confirmPasswordTEController =>
      _confirmPasswordTEController;

  GlobalKey<FormState> get signUpFormKey => _signUpFormKey;

  GlobalKey<FormState> get signInFormKey => _signInFormKey;

  //it is used for updating the btn state in signIn and signUp
  void updateAuthState(FormKey formKey) {
    bool isValid = _emailTEController.text.isNotEmpty &&
        _passwordTEController.text.isNotEmpty;
    if (formKey == FormKey.signUpFormKey) {
      isValid = isValid && _confirmPasswordTEController.text.isNotEmpty;
    }
    allowAuth.value = isValid && _validateForm(formKey);
  }

  bool _validateForm(FormKey formKey) {
    switch (formKey) {
      case FormKey.signInFormKey:
        return _signInFormKey.currentState?.validate() ?? false;
      case FormKey.signUpFormKey:
        return _signUpFormKey.currentState?.validate() ?? false;
      default:
        return false;
    }
  }

  Future<(bool, String)> signUp() async {
    return authenticate(
      () async {
        await _authService.signUp(
          _emailTEController.text,
          _passwordTEController.text,
        );
        User? userInfo = getCurrentUser();
        await uploadProfile(userInfo, false);
        _refreshUserModel();
        return true;
      },
    );
  }

  Future<(bool, String)> signIn() async {
    return await authenticate(
      () async {
        await _authService.signIn(
          _emailTEController.text,
          _passwordTEController.text,
        );
        User? userInfo = getCurrentUser();
        hasUpdatedInfo = await verifyUser(userInfo!.uid);
        await _cacheUserData(userInfo, hasUpdatedInfo);
        _refreshUserModel();
        return true;
      },
    );
  }

  //refactored common function for both signIn and signUp
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
    } finally {
      isAuthenticating.toggle();
    }
    return (isSuccess, errorMessage);
  }

  //it uploads profile information to firebase
  Future<void> uploadProfile(User? userInfo, bool hasUpdatedInfo) async {
    try {
      Map<String, dynamic> userModel =
          createUserModel(userInfo, hasUpdatedInfo);
      await _authService.uploadProfile(
        userModel,
        getCurrentUser()!.uid,
      );
      await _cacheUserData(userInfo, hasUpdatedInfo);
    } catch (exception) {
      logger.e(exception);
    }
  }

  //it verifies if a user has already passed the preliminary profile update or not
  Future<bool> verifyUser(String uId) async {
    bool isVerified = false;
    try {
      isVerified = await _authService.verifyUser(uId);
    } catch (exception) {
      logger.e(exception);
    }
    return isVerified;
  }

  //it stores user information in cache after the upload
  Future<void> _cacheUserData(User? userInfo, bool hasUpdatedInfo) async {
    await AppStorage().write(
      "userData",
      jsonEncode(
        createUserModel(userInfo, true),
      ),
    );
    await AppStorage().write("savePassword", savePassword.value);
  }

  void _refreshUserModel() {
    _profileVM.loadUserModel();
  }

  User? getCurrentUser() {
    return FirebaseAuth.instance.currentUser;
  }

  Map<String, dynamic> createUserModel(User? userInfo, bool hasUpdatedInfo) {
    return {
      "displayName": userInfo?.displayName,
      "phoneNumber": userInfo?.phoneNumber,
      "email": userInfo?.email,
      "isEmailVerified": userInfo?.emailVerified,
      "photoUrl": userInfo?.photoURL,
      "refreshToken": userInfo?.refreshToken,
      "uId": userInfo?.uid,
      "hasUpdatedInfo": hasUpdatedInfo,
    };
  }

  void resetController() {
    _emailTEController.clear();
    _passwordTEController.clear();
    _confirmPasswordTEController.clear();
    hasUpdatedInfo = false;
    savePassword.value = false;
    allowAuth.value = false;
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _passwordTEController.dispose();
    _confirmPasswordTEController.dispose();
    emailFocusNode.unfocus();
    emailFocusNode.dispose();
    passwordFocusNode.unfocus();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    super.dispose();
  }
}
