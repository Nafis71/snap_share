import 'package:flutter/material.dart';
import 'package:snap_share/export_file.dart';

class LightTextThemes {
  static TextTheme get textTheme {
    return TextTheme(
      titleLarge: TextThemeStyles.getDefaultTextStyle().copyWith(
          color: LightThemeColors.primaryTxtColor,
          fontSize: FontSizes.titleLargeTxtSize),
      titleMedium: TextThemeStyles.getDefaultTextStyle().copyWith(
          color: LightThemeColors.primaryTxtColor,
          fontSize: FontSizes.titleMediumTxtSize),
    );
  }
}
