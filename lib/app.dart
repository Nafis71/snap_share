import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snap_share/export_file.dart';

class SnapShare extends StatelessWidget {
  const SnapShare({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const SplashView(),
      getPages: AppRoutes.appRoutes(),
      theme: LightAppThemes.themeData(),
      darkTheme: DarkAppThemes.themeData(),
      themeMode: ThemeMode.system,
    );
  }
}
