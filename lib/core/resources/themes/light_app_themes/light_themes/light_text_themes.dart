import 'package:flutter/material.dart';
import 'package:snap_share/core/utilities/exports/resource_export.dart';

class LightTextThemes {
  static TextTheme get textTheme {
    return TextTheme(
      titleLarge: TextThemeStyles.getDefaultTextStyle().copyWith(
          color: LightThemeColors.kPrimaryTxtColor,
          fontSize: FontSizes.kTitleLargeTxtSize),
      titleMedium: TextThemeStyles.getDefaultTextStyle().copyWith(
          color: LightThemeColors.kPrimaryTxtColor,
          fontSize: FontSizes.kTitleMediumTxtSize),
    );
  }
}
