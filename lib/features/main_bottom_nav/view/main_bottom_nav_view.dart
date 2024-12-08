import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snap_share/core/resources/managers/theme_manager.dart';
import 'package:snap_share/features/main_bottom_nav/view_model/main_bottom_nav_vm.dart';
import 'package:snap_share/features/main_bottom_nav/widget/main_bottom_nav_bar.dart';

class MainBottomNavView extends StatelessWidget {
  const MainBottomNavView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final MainBottomNavVM mainBottomNavVM = Get.find();
    final ThemeManager themeManager = Get.find();
    return Obx(
      () {
        return Scaffold(
          body: mainBottomNavVM.views[mainBottomNavVM.selectedIndex.value],
          bottomNavigationBar: MainBottomNavBar(
            mainBottomNavVM: mainBottomNavVM,
            themeManager: themeManager,
          ),
        );
      },
    );
  }
}
