import 'package:snap_share/core/utilities/constants/reg_exp.dart';

class FormValidator {
  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) return "Invalid Email";
    if (!RegEx.emailRegEx.hasMatch(email)) return "Invalid Email";
    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) return "Invalid Password";
    if (password.length < 6) {
      return "Weak password\nProvide at least 6 digit password";
    }
    return null;
  }

  static String? validateConfirmPassword(
      String? confirmPassword, String? password) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return null;
    }
    if (password != null && confirmPassword != password) {
      return "Password didn't match";
    }
    return null;
  }
}
