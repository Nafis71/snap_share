import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:snap_share/core/resources/themes/base_styles/custom_app_bar_style.dart';
import 'package:snap_share/core/utilities/exports/resource_export.dart';

class DarkAppBarTheme {
  static AppBarTheme getTheme() {
    return CustomAppBarStyle.getDefaultStyle().copyWith(
      backgroundColor: DarkThemeColors.kScaffoldBGColor,
      surfaceTintColor: DarkThemeColors.kScaffoldBGColor,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: DarkThemeColors.kScaffoldBGColor,
        statusBarBrightness: Brightness.light,
      ),
    );
  }
}
