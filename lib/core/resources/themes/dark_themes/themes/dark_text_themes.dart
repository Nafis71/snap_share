import 'package:flutter/material.dart';
import 'package:snap_share/core/resources/colors/font_colors.dart';
import 'package:snap_share/core/resources/dimensions/font_sizes.dart';
import 'package:snap_share/core/utilities/exports/resource_export.dart';

class DarkTextThemes {
  static TextTheme get textTheme {
    return TextTheme(
      titleLarge: TextThemeStyles.getDefaultTextStyle().copyWith(
        color: FontColors.kDTitleLC,
        fontFamily: "Lobster",
        fontSize: FontSizes.kTitleLarge,
      ),
      titleMedium: TextThemeStyles.getDefaultTextStyle().copyWith(
        color: FontColors.kDTitleMC,
        fontSize: FontSizes.kTitleMedium,
      ),
      titleSmall: TextThemeStyles.getDefaultTextStyle().copyWith(
          color: FontColors.kDTitleSC,
          fontWeight: FontWeight.w600,
          fontSize: FontSizes.kTitleSmall),
      headlineLarge: TextThemeStyles.getDefaultTextStyle().copyWith(
        fontWeight: FontWeight.normal,
        fontSize: FontSizes.kHeadlineLarge,
        color: FontColors.kDHeadlineLC,
      ),
      bodyLarge: TextThemeStyles.getDefaultTextStyle().copyWith(
        fontSize: FontSizes.kBodyLarge,
      ),
      bodyMedium: TextThemeStyles.getDefaultTextStyle()
          .copyWith(color: FontColors.kDBodyMC),
      bodySmall: TextThemeStyles.getDefaultTextStyle().copyWith(
        fontSize: FontSizes.kBodySmall,
        color: FontColors.kDBodySC,
      ),
    );
  }
}
