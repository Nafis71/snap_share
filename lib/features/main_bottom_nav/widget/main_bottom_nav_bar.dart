import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:snap_share/core/resources/managers/theme_manager.dart';
import 'package:snap_share/core/utilities/exports/resource_export.dart';
import 'package:snap_share/core/utilities/exports/wrapper_export.dart';
import 'package:snap_share/features/main_bottom_nav/view_model/main_bottom_nav_vm.dart';

class MainBottomNavBar extends StatelessWidget {
  final ThemeManager themeManager;
  final MainBottomNavVM mainBottomNavVM;

  const MainBottomNavBar({
    super.key,
    required this.mainBottomNavVM,
    required this.themeManager,
  });

  @override
  Widget build(BuildContext context) {
    return SalomonBottomBar(
      currentIndex: mainBottomNavVM.selectedIndex,
      onTap: mainBottomNavVM.onChangedIndex,
      itemShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      items: [
        _bottomNavIcon(IconAssets.kHomeIcon, 0),
        _bottomNavIcon(IconAssets.kSearchIcon, 1),
        _bottomNavIcon(IconAssets.kAddIcon, 2),
        _bottomNavIcon(IconAssets.kProfileIcon, 3),
      ],
    );
  }

  SalomonBottomBarItem _bottomNavIcon(String asset, int index) {
    return SalomonBottomBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(left: 14.0, right: 7),
        child: Obx(
          () => SvgLoader(
            asset: asset,
            color: mainBottomNavVM.selectedIndex == index
                ? AppColors.kPrimaryColor
                : (themeManager.isDarkMode(Get.context!)
                    ? Colors.white
                    : Colors.black),
          ),
        ),
      ),
      title: const SizedBox(),
    );
  }
}
