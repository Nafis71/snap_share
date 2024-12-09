import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:snap_share/core/utilities/constants/reg_exp.dart';
import 'package:snap_share/core/wrappers/logger.dart';

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
  static String? validateUserName(String? userName){
    if(userName == null || userName.isEmpty) return "Invalid user name";
    if(userName.contains(' ')) return "Whitespaces are not allowed";
    return null;
  }

  static Future<bool> isUserNameTaken(String userName)async{
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection("users").where("username",isEqualTo: userName).get();
    logger.d(snapshot.docs);
    if(snapshot.docs.isEmpty){
      return false;
    }
    return true;
  }
}
