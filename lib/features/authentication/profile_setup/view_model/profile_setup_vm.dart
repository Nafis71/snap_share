import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:snap_share/features/common/services/image_picker_service.dart';

class ProfileSetupVM extends GetxController {
  RxBool isPictureUploaded = false.obs;
  final PageController _pageController = PageController();
  final TextEditingController _usernameTEController = TextEditingController();
  final TextEditingController _profileNameTEController = TextEditingController();
  final FocusNode userNameFocusNode = FocusNode();
  final FocusNode profileNameFocusNode = FocusNode();
  final RxBool completedStep = false.obs;
  final ImagePickerService _imagePickerService;
  final Rxn<File> _pickedImage = Rxn<File>();
  RxBool isLoading = false.obs;

  ProfileSetupVM(this._imagePickerService);

  PageController get pageController => _pageController;

  TextEditingController get usernameTEController => _usernameTEController;
  TextEditingController get profileNameTEController => _profileNameTEController;

  File? get pickedImage => _pickedImage.value;

  Future<void> pickImage() async {
    String? imagePath =
        await _imagePickerService.pickImage(ImageSource.gallery);
    if (imagePath != null) {
      isLoading.toggle();
      _pickedImage.value = File(imagePath);
      await Future.delayed(const Duration(seconds: 1));
      completedStep.value = true;
      isLoading.toggle();
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    _usernameTEController.dispose();
    _profileNameTEController.dispose();
    userNameFocusNode.dispose();
    profileNameFocusNode.dispose();
    super.dispose();
  }
}
