import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:snap_share/features/authentication/common/enums/view_type.dart';

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
 // Rx<bool> allowForLogin = false.obs;
  Rx<bool> allowAuthAction = false.obs;
  Rx<bool> savePassword = false.obs;

  Rx<TextEditingController> get emailTEController => _emailTEController;

  Rx<TextEditingController> get passwordTEController => _passwordTEController;

  Rx<TextEditingController> get confirmPasswordTEController =>
      _confirmPasswordTEController;

  GlobalKey<FormState> get formKey => _formKey.value;

  void resetTextControllers({bool clearConfirmPassword = false}) {
    _emailTEController.value.clear();
    _passwordTEController.value.clear();
    if (clearConfirmPassword) {
      _confirmPasswordTEController.value.clear();
    }
  }

  void updateAuthState(ViewType viewType) {
    if (viewType == ViewType.login) {
      allowAuthAction.value = _emailTEController.value.text.isNotEmpty &&
          _passwordTEController.value.text.isNotEmpty &&
          _validateForm() == true;
    } else if (viewType == ViewType.signUp) {
      allowAuthAction.value = _emailTEController.value.text.isNotEmpty &&
          _passwordTEController.value.text.isNotEmpty &&
          _confirmPasswordTEController.value.text.isNotEmpty &&
          _validateForm() == true;
    }
  }

  bool _validateForm() {
    return _formKey.value.currentState?.validate() ?? false;
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
