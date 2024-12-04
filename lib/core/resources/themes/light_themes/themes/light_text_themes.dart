import 'package:flutter/material.dart';
import 'package:snap_share/core/resources/colors/font_colors.dart';
import 'package:snap_share/core/resources/dimensions/font_sizes.dart';
import 'package:snap_share/core/utilities/exports/resource_export.dart';

class LightTextThemes {
  static TextTheme get textTheme {
    return TextTheme(
      titleLarge: TextThemeStyles.getDefaultTextStyle().copyWith(
        color: FontColors.kLTitleLC,
        fontFamily: "Lobster",
        fontWeight: FontWeight.w400,
        fontSize: FontSizes.kTitleLarge,
      ),
      titleMedium: TextThemeStyles.getDefaultTextStyle().copyWith(
        color: FontColors.kLTitleMC,
        fontWeight: FontWeight.bold,
        fontSize: FontSizes.kTitleMedium,
      ),
      headlineLarge: TextThemeStyles.getDefaultTextStyle().copyWith(
        fontWeight: FontWeight.normal,
        fontSize: FontSizes.kHeadlineLarge,
      ),
      bodyLarge: TextThemeStyles.getDefaultTextStyle().copyWith(
        fontSize: FontSizes.kBodyLarge,
      ),
      bodyMedium: TextThemeStyles.getDefaultTextStyle(),
      bodySmall: TextThemeStyles.getDefaultTextStyle().copyWith(
        fontSize: FontSizes.kBodySmall,
        color: FontColors.kLBodySC,
      ),
    );
  }
}
