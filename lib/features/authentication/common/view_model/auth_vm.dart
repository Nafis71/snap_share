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
  Map<String, dynamic>? userInfoJson;
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
    return _authenticate(
      () async {
        await _authService.signUp(
          _emailTEController.text,
          _passwordTEController.text,
        );
        await _uploadProfile(
          jsonData: createUserModelJson(hasUpdatedInfo: hasUpdatedInfo),
          hasUpdatedInfo: false,
        );
        _refreshUserModel();
        return true;
      },
    );
  }

  Future<(bool, String)> signIn() async {
    return await _authenticate(
      () async {
        await _authService.signIn(
          _emailTEController.text,
          _passwordTEController.text,
        );
        User? authUser = getCurrentUser();
        userInfoJson = await _fetchUserInfo(authUser!.uid);
        hasUpdatedInfo = userInfoJson?['hasUpdatedInfo'];
        if (!hasUpdatedInfo) {
          savePassword.value = false;
        }
        await _cacheUserData(
          jsonData: userInfoJson,
          hasUpdatedInfo: hasUpdatedInfo,
          username: userInfoJson?['username'],
          profileName: userInfoJson?['displayName'],
        );
        _refreshUserModel();
        return true;
      },
    );
  }

  //refactored common function for both signIn and signUp
  Future<(bool, String)> _authenticate(Future<bool> Function() callback) async {
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
  Future<void> _uploadProfile({
    required Map<String, dynamic> jsonData,
    required bool hasUpdatedInfo,
  }) async {
    try {
      await _authService.uploadProfile(
        jsonData,
        getCurrentUser()!.uid,
      );
      await _cacheUserData(
        jsonData: jsonData,
        hasUpdatedInfo: hasUpdatedInfo,
      );
    } catch (exception) {
      logger.e(exception);
    }
  }

  Future<Map<String, dynamic>?> _fetchUserInfo(String uId) async {
    Map<String, dynamic>? userInfo;
    try {
      userInfo = await _authService.fetchUser(uId);
    } catch (exception) {
      logger.e(exception);
    }
    return userInfo;
  }

  Future<void> updateUserData({
    required String username,
    required String profileName,
    required String profilePicture,
  }) async {
    Map<String, dynamic>? json;
    if (userInfoJson == null) {
      json = createUserModelJson(
        hasUpdatedInfo: true,
        profileName: profileName,
        profilePicture: profilePicture,
        username: username,
      );
    } else {
      userInfoJson?['username'] = username;
      userInfoJson?['displayName'] = profileName;
      userInfoJson?['photoUrl'] = profilePicture;
      userInfoJson?['hasUpdatedInfo'] = true;
      json = userInfoJson;
    }
    await _authService.uploadProfile(
      json!,
      getCurrentUser()!.uid,
    );
    savePassword.value = true;
    await _cacheUserData(
      jsonData: json,
      hasUpdatedInfo: hasUpdatedInfo,
    );
  }

  //it stores user information in cache after the upload
  Future<void> _cacheUserData({
    required Map<String, dynamic>? jsonData,
    required bool hasUpdatedInfo,
    String? username,
    String? profileName,
  }) async {
    await AppStorage().write(
      "userData",
      jsonEncode(jsonData),
    );
    await AppStorage().write("savePassword", savePassword.value);
  }

  void _refreshUserModel() {
    _profileVM.loadUserModel();
  }

  User? getCurrentUser() {
    return FirebaseAuth.instance.currentUser;
  }

  Map<String, dynamic> createUserModelJson({
    required bool hasUpdatedInfo,
    String? username,
    String? profileName,
    String? profilePicture,
  }) {
    return {
      "displayName": profileName,
      "phoneNumber": null,
      "email": getCurrentUser()!.email,
      "isEmailVerified": getCurrentUser()?.emailVerified,
      "photoUrl": profilePicture,
      "refreshToken": getCurrentUser()?.refreshToken,
      "uId": getCurrentUser()?.uid,
      "hasUpdatedInfo": hasUpdatedInfo,
      "username": username,
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
