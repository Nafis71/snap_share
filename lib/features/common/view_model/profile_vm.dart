import 'dart:convert';

import 'package:get/get.dart';
import 'package:snap_share/features/common/models/user_model.dart';
import 'package:snap_share/features/common/services/app_storage.dart';

class ProfileVM extends GetxController {
  late UserModel _userModel;

  get userModel => _userModel;

  set setUserModel(UserModel userModel) => _userModel = userModel;

  ProfileVM() {
    loadUserModel();
  }

  void loadUserModel() {
    String? userData = AppStorage().read("userData");
    if (userData != null) {
      _userModel = UserModel.fromJson(jsonDecode(userData));
    }
  }
}
