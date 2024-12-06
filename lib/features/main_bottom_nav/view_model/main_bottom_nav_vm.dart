import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snap_share/core/resources/managers/theme_manager.dart';
import 'package:snap_share/features/add_new_post/view/add_new_post_view.dart';
import 'package:snap_share/features/home/view/home_view.dart';
import 'package:snap_share/features/profile/view/profile_view.dart';
import 'package:snap_share/features/search/view/search_view.dart';

class MainBottomNavVM extends GetxController {
  final ThemeManager themeManager;
  final RxInt _selectedIndex = 0.obs;
  final List<Widget> _views = [
    const HomeView(),
    const SearchView(),
    const AddNewPostView(),
  ];

  MainBottomNavVM(this.themeManager) {
    _views.add(
      ProfileView(
        themeManager: themeManager,
      ),
    );
  }

  int get selectedIndex => _selectedIndex.value;

  List<Widget> get views => _views;

  void onChangedIndex(int index) {
    _selectedIndex.value = index;
  }
}
