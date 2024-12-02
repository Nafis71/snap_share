import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snap_share/features/add_new_post/view/add_new_post_view.dart';
import 'package:snap_share/features/home/view/home_view.dart';
import 'package:snap_share/features/profile/view/profile_view.dart';
import 'package:snap_share/features/search/view/search_view.dart';

import '../../../core/utilities/exports/resource_export.dart';

class MainBottomNavVM extends GetxController {
  int _selectedIndex = 0;
  final List<Widget> _views = const [
    HomeView(),
    SearchView(),
    AddNewPostView(),
    ProfileView(),
  ];

  int get selectedIndex => _selectedIndex;

  List<Widget> get views => _views;

  void onChangedIndex(int index) {
    _selectedIndex = index;
    update();
  }

  Color iconBgColor(int index) {
    return _selectedIndex == index
        ? Colors.blue.withOpacity(0.15)
        : Colors.transparent;
  }
  Color iconColor(int index) {
    return _selectedIndex == index
        ? AppColors.kPrimaryColor
        : AppColors.kBlackColor;
  }
}
