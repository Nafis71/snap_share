import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:snap_share/features/new_post/common/view_model/new_post_vm.dart';

class PostComposerVM extends GetxController {
  final NewPostVM _newPostVM;
  final Rx<TextEditingController> _captionController =
      TextEditingController().obs;

  Rx<TextEditingController> get captionController => _captionController;

  PostComposerVM(this._newPostVM);

  File? getImageFromPath() {
    return _newPostVM.selectedImagePath;
  }

  Rxn<AssetEntity>? getImageEntity() {
    return _newPostVM.selectedPhoto;
  }
}
