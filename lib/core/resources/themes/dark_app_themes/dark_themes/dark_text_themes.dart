import 'package:flutter/material.dart';
import 'package:snap_share/core/utilities/exports/resource_export.dart';

class DarkTextThemes {
  static TextTheme get textTheme {
    return TextTheme(
      titleLarge: TextThemeStyles.getDefaultTextStyle().copyWith(
          color: DarkThemeColors.kPrimaryTxtColor,
          fontSize: FontSizes.kTitleLargeTxtSize),
      titleMedium: TextThemeStyles.getDefaultTextStyle().copyWith(
          color: DarkThemeColors.kPrimaryTxtColor,
          fontSize: FontSizes.kTitleMediumTxtSize),
    );
  }
}
