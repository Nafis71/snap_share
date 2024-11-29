import 'package:flutter/material.dart';
import 'package:snap_share/core/utilities/exports/resource_export.dart';

class LightAppThemes {
  static ThemeData themeData() {
    return ThemeData(
      primaryColor: LightThemeColors.kPrimaryColor,
      scaffoldBackgroundColor: LightThemeColors.kScaffoldBGColor,
      textTheme: LightTextThemes.textTheme,
    );
  }
}
