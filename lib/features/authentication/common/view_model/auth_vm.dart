import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthVM extends GetxController {
  @override
  void onInit() {
    addListeners();
    super.onInit();
  }

  final Rx<GlobalKey<FormState>> _formKey = GlobalKey<FormState>().obs;
  final Rx<TextEditingController> _emailTEController =
      TextEditingController().obs;
  final Rx<TextEditingController> _passwordTEController =
      TextEditingController().obs;
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  Rx<bool> allowForLogin = false.obs;
  Rx<bool> savePassword = false.obs;

  Rx<TextEditingController> get emailTEController => _emailTEController;

  Rx<TextEditingController> get passwordTEController => _passwordTEController;

  GlobalKey<FormState> get formKey => _formKey.value;

  void resetTextControllers() {
    _emailTEController.value.clear();

    _passwordTEController.value.clear();
  }

  void addListeners() {
    _emailTEController.value.addListener(_updateLoginState);
    _passwordTEController.value.addListener(_updateLoginState);
  }

  void _updateLoginState() {
    allowForLogin.value = _emailTEController.value.text.isNotEmpty &&
        _passwordTEController.value.text.isNotEmpty &&
        _validateForm() == true;
  }

  bool _validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  @override
  void onClose() {
    _emailTEController.value.dispose();
    _passwordTEController.value.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.onClose();
  }
}
