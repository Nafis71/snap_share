import 'package:flutter/material.dart';
import 'package:snap_share/export_file.dart';

class LightTextThemes {
  static TextTheme get textTheme {
    return TextTheme(
      titleLarge: TextThemeStyles.titleLargeTextStyle(
        color: LightThemeColors.primaryTxtColor,
      ),
      titleMedium: TextThemeStyles.titleMediumTextStyle(
        color: LightThemeColors.primaryTxtColor,
      ),
    );
  }
}
