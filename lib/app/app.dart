import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snap_share/core/resources/managers/theme_manager.dart';
import 'package:snap_share/core/utilities/exports/resource_export.dart';
import 'package:snap_share/core/utilities/exports/route_export.dart';

class SnapShare extends StatelessWidget {
  const SnapShare({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RoutesNames.kProfileSetupView,
        getPages: AppRoutes.appRoutes(),
        theme: LightAppThemes.themeData(),
        darkTheme: DarkAppThemes.themeData(),
        themeMode: Get.find<ThemeManager>().currentTheme,
      ),
    );
  }
}
