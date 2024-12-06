import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:snap_share/features/new_post/common/view_model/new_post_vm.dart';

class PostComposerVM extends GetxController {
  final NewPostVM newPostVM;
  final Rx<TextEditingController> _captionController = TextEditingController().obs;

  Rx<TextEditingController> get captionController => _captionController;

  PostComposerVM(this.newPostVM);
}
