import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snap_share/core/utilities/exports/resource_export.dart';
import 'package:snap_share/core/utilities/exports/route_export.dart';

import '../features/splash/view/splash_view.dart';

class SnapShare extends StatelessWidget {
  const SnapShare({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashView(),
      getPages: AppRoutes.appRoutes(),
      theme: LightAppThemes.themeData(),
      darkTheme: DarkAppThemes.themeData(),
      themeMode: ThemeMode.system,
    );
  }
}
