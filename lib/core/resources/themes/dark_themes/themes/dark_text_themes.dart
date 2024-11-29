import 'package:flutter/material.dart';
import 'package:snap_share/core/resources/dimensions/font_sizes.dart';
import 'package:snap_share/core/utilities/exports/resource_export.dart';

class DarkTextThemes {
  static TextTheme get textTheme {
    return TextTheme(
      titleLarge: TextThemeStyles.getDefaultTextStyle().copyWith(
        color: DarkThemeColors.kPrimaryTxtColor,
        fontFamily: "Lobster",
        fontSize: FontSizes.kTitleLarge,
      ),
      titleMedium: TextThemeStyles.getDefaultTextStyle().copyWith(
        color: DarkThemeColors.kPrimaryTxtColor,
        fontSize: FontSizes.kTitleMedium,
      ),
      headlineLarge: TextThemeStyles.getDefaultTextStyle().copyWith(
        fontWeight: FontWeight.normal,
        fontSize: FontSizes.kHeadlineLarge,
        color: DarkThemeColors.kPrimaryTxtColor,
      ),
      bodyLarge: TextThemeStyles.getDefaultTextStyle().copyWith(
        fontSize: FontSizes.kBodyLarge,
      ),
      bodyMedium: TextThemeStyles.getDefaultTextStyle()
          .copyWith(color: DarkThemeColors.kPrimaryTxtColor),
    );
  }
}
