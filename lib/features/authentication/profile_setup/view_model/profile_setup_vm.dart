import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:snap_share/core/utilities/validators/form_validator.dart';
import 'package:snap_share/features/authentication/common/view_model/auth_vm.dart';
import 'package:snap_share/features/authentication/profile_setup/utilities/profile_setup_strings.dart';
import 'package:snap_share/features/common/services/firebase_storage_service.dart';
import 'package:snap_share/features/common/services/image_picker_service.dart';

class ProfileSetupVM extends GetxController {
  RxBool isPictureUploaded = false.obs;
  final PageController _pageController = PageController();
  final TextEditingController _usernameTEController = TextEditingController();
  final TextEditingController _profileNameTEController =
      TextEditingController();
  final FocusNode userNameFocusNode = FocusNode();
  final FocusNode profileNameFocusNode = FocusNode();
  final RxBool completedStep = false.obs;
  final ImagePickerService _imagePickerService;
  final AuthVM _authVM;
  final FirebaseStorageService _firebaseStorageService;
  final Rxn<File> _pickedImage = Rxn<File>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
  Rxn<String> userNameErrorTxt = Rxn<String>();

  ProfileSetupVM(
    this._imagePickerService,
    this._authVM,
    this._firebaseStorageService,
  );

  PageController get pageController => _pageController;

  TextEditingController get usernameTEController => _usernameTEController;

  TextEditingController get profileNameTEController => _profileNameTEController;

  GlobalKey<FormState> get formKey => _formKey;

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

  void updateButtonState() {
    completedStep.value = _usernameTEController.text.isNotEmpty &&
        _profileNameTEController.text.isNotEmpty &&
        userNameErrorTxt.value == null &&
        _validateForm();
  }

  bool _validateForm() {
    return _formKey.currentState!.validate();
  }

  Future<void> initiateProfileCreation() async {
    isLoading.toggle();
    User? authUser = FirebaseAuth.instance.currentUser;
    String? imageUrl = await _firebaseStorageService.uploadToStorageBucket(
      storagePath: "snap-share-user-profile-pictures",
      id: authUser!.uid,
      file: _pickedImage.value!,
    );
    if (imageUrl != null) {
      await _authVM.updateUserData(
        username: _usernameTEController.text,
        profileName: _profileNameTEController.text,
        profilePicture: imageUrl,
      );
    }
    isLoading.toggle();
  }

  Future<void> isUserNameTaken(String? userName) async {
    if (userName == null) {
      return;
    }
    bool status = await FormValidator.isUserNameTaken(userName);
    if (status) {
      userNameErrorTxt.value = ProfileSetupStrings.kUserNameTakenErrorText;
      return;
    }
    userNameErrorTxt.value = null;
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
