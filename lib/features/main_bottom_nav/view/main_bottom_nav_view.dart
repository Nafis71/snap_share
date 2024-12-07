import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:snap_share/core/resources/managers/theme_manager.dart';
import 'package:snap_share/core/utilities/exports/resource_export.dart';
import 'package:snap_share/core/utilities/exports/widget_export.dart';
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
          appBar: CommonAppBar(
            title: mainBottomNavVM.getAppBarTitle(),
            disableBackBtn: true,
            centerTitle: true,
            isBrandName: false,
            backgroundColor: themeManager.isDarkMode(context)
                ? DarkThemeColors.kComponentBGColor
                : null,
            statusBarColor: SystemUiOverlayStyle(
              statusBarColor: themeManager.isDarkMode(context)
                  ? DarkThemeColors.kComponentBGColor
                  : LightThemeColors.kScaffoldBGColor,
              statusBarIconBrightness: themeManager.isDarkMode(context)
                  ? Brightness.light
                  : Brightness.dark,
            ),
          ),
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
