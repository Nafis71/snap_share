import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snap_share/features/common/widgets/image_picker_widget.dart';
import 'package:snap_share/features/home/view/home_view.dart';
import 'package:snap_share/features/profile/view/profile_view.dart';
import 'package:snap_share/features/search/view/search_view.dart';

import '../../new_post/media_selection/view/media_selection_view.dart';

enum TabIndex { home, search, newPost, profile }

class MainBottomNavVM extends GetxController {
  final RxInt selectedIndex = 0.obs;
  final List<Widget> _views = [
    const HomeView(),
    const SearchView(),
    const MediaSelectionView()
  ];

  MainBottomNavVM() {
    _views.add(
      const ProfileView(),
    );
  }

  List<Widget> get views => _views;

  void onChangedIndex(int index) {
    if (index == TabIndex.newPost.index) {
      _showImagePickerDialog();
      return;
    }
    selectedIndex.value = index;
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
