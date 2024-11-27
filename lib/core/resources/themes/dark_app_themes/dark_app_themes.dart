import 'package:flutter/material.dart';
import 'package:snap_share/core/utilities/exports/resource_export.dart';


class DarkAppThemes {
  static ThemeData themeData() {
    return ThemeData(
      primaryColor: DarkThemeColors.kPrimaryColor,
      textTheme: DarkTextThemes.textTheme,
    );
  }
}
