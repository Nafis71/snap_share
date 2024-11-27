import 'package:flutter/material.dart';
import 'package:snap_share/export_file.dart';

class DarkTextThemes {
  static TextTheme get textTheme {
    return TextTheme(
      titleLarge: TextThemeStyles.getDefaultTextStyle().copyWith(
          color: DarkThemeColors.primaryTxtColor,
          fontSize: FontSizes.titleLargeTxtSize),
      titleMedium: TextThemeStyles.getDefaultTextStyle().copyWith(
          color: DarkThemeColors.primaryTxtColor,
          fontSize: FontSizes.titleMediumTxtSize),
    );
  }
}
