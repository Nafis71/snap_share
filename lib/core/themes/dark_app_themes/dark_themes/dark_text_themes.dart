import 'package:flutter/material.dart';
import 'package:snap_share/export_file.dart';

class DarkTextThemes {
  static TextTheme get textTheme {
    return TextTheme(
      titleLarge: TextThemeStyles.titleLargeTextStyle(
        color: DarkThemeColors.primaryTxtColor,
      ),
      titleMedium: TextThemeStyles.titleMediumTextStyle(
        color: DarkThemeColors.primaryTxtColor,
      ),
    );
  }
}
