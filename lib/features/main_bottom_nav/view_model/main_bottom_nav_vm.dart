import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snap_share/core/resources/managers/theme_manager.dart';
import 'package:snap_share/features/common/widgets/image_picker_widget.dart';
import 'package:snap_share/features/home/view/home_view.dart';
import 'package:snap_share/features/new_post/view/new_post_view.dart';
import 'package:snap_share/features/profile/view/profile_view.dart';
import 'package:snap_share/features/search/view/search_view.dart';

enum TabIndex { home, search, newPost, profile }

class MainBottomNavVM extends GetxController {
  final ThemeManager themeManager;
  final RxInt selectedIndex = 0.obs;
  RxBool hasPickedImage = false.obs;
  final List<Widget> _views = [
    const HomeView(),
    const SearchView(),
    const NewPostView()
  ];

  MainBottomNavVM(this.themeManager) {
    _views.add(
      ProfileView(
        themeManager: themeManager,
      ),
    );
  }

  List<Widget> get views => _views;

  void onChangedIndex(int index) {
    if (index == TabIndex.newPost.index && !hasPickedImage.value) {
      _showImagePickerDialog();
      return;
    }
    selectedIndex.value = index;
    hasPickedImage.value = false;
  }

  void _showImagePickerDialog() {
    if (Get.context != null) {
      showDialog(
        context: Get.context!,
        builder: (context) {
          return const ImagePickerWidget();
        },
      );
    }
  }
}
