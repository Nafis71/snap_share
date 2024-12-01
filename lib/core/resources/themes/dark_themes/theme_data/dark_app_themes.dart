import 'package:flutter/material.dart';
import 'package:snap_share/core/resources/themes/dark_themes/themes/dark_app_bar_theme.dart';
import 'package:snap_share/core/resources/themes/dark_themes/themes/dark_elevated_button_theme.dart';
import 'package:snap_share/core/utilities/exports/resource_export.dart';

class DarkAppThemes {
  static ThemeData themeData() {
    return ThemeData(
      primaryColor: DarkThemeColors.kPrimaryColor,
      scaffoldBackgroundColor: DarkThemeColors.kScaffoldBGColor,
      textTheme: DarkTextThemes.textTheme,
      elevatedButtonTheme: DarkElevatedButtonTheme.getTheme(),
      appBarTheme: DarkAppBarTheme.getTheme(),
    );
  }
}
