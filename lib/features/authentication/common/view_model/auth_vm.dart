import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthVM extends GetxController {
  final Rx<GlobalKey<FormState>> _formKey = GlobalKey<FormState>().obs;
  final Rx<TextEditingController> _emailTEController =
      TextEditingController().obs;
  final Rx<TextEditingController> _passwordTEController =
      TextEditingController().obs;
  Rx<bool> allowForLogin = false.obs;
  Rx<bool> savePassword = false.obs;

  Rx<TextEditingController> get emailTEController => _emailTEController;

  Rx<TextEditingController> get passwordTEController => _passwordTEController;

  GlobalKey<FormState> get formKey => _formKey.value;

  void resetTextControllers() {
    _emailTEController.value.clear();
    _passwordTEController.value.clear();
  }

  void listenTextEditors() {
    allowForLogin.value = _emailTEController.value.text.isNotEmpty &&
        _passwordTEController.value.text.isNotEmpty &&
        _formKey.value.currentState?.validate() == true;
  }
}
