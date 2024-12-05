import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:snap_share/core/utilities/exports/resource_export.dart';

class CustomAppBarStyle {
  static AppBarTheme getDefaultStyle() {
    return const AppBarTheme(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: LightThemeColors.kScaffoldBGColor,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }
}
