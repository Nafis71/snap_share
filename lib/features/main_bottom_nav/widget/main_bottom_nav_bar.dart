import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:snap_share/features/main_bottom_nav/view_model/main_bottom_nav_vm.dart';

import '../../../core/resources/colors/app_colors.dart';

class MainBottomNavBar extends StatelessWidget {
  const MainBottomNavBar({
    super.key,
    required this.mainBottomNavVM,
  });

  final MainBottomNavVM mainBottomNavVM;

  @override
  Widget build(BuildContext context) {
    return SalomonBottomBar(
      selectedItemColor: AppColors.kPrimaryColor,
      unselectedItemColor: AppColors.kBlackColor,
      currentIndex: mainBottomNavVM.selectedIndex,
      onTap: mainBottomNavVM.onChangedIndex,
      itemShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      items: [
        _bottomNavIcon(Icons.home_outlined),
        _bottomNavIcon(Icons.search_outlined),
        _bottomNavIcon(Icons.add),
        _bottomNavIcon(Icons.person_outline),
      ],
    );
  }

  SalomonBottomBarItem _bottomNavIcon(IconData icon) {
    return SalomonBottomBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(left: 14.0, right: 7),
        child: Icon(icon),
      ),
      title: const SizedBox(),
    );
  }
}
