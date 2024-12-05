import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snap_share/core/resources/managers/theme_manager.dart';
import 'package:snap_share/features/main_bottom_nav/view_model/main_bottom_nav_vm.dart';
import 'package:snap_share/features/main_bottom_nav/widget/main_bottom_nav_bar.dart';

class MainBottomNavView extends StatefulWidget {
  final MainBottomNavVM mainBottomNavVM;

  const MainBottomNavView({
    super.key,
    required this.mainBottomNavVM,
  });

  @override
  State<MainBottomNavView> createState() => _MainBottomNavViewState();
}

class _MainBottomNavViewState extends State<MainBottomNavView> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Scaffold(
          body: widget
              .mainBottomNavVM.views[widget.mainBottomNavVM.selectedIndex],
          bottomNavigationBar: MainBottomNavBar(
            mainBottomNavVM: widget.mainBottomNavVM,
            themeManager: Get.find<ThemeManager>(),
          ),
        );
      },
    );
  }
}
