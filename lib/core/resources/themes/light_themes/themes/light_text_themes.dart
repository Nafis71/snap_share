import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snap_share/core/utilities/exports/resource_export.dart';

class LightTextThemes {
  static TextTheme get textTheme {
    return TextTheme(
      titleLarge:
          TextThemeStyles.getDefaultTextStyle(fontFamily: GoogleFonts.lobster)
              .copyWith(
        color: LightThemeColors.kPrimaryTxtColor,
        fontWeight: FontWeight.w400,
        fontSize: 26,
      ),
      titleMedium: TextThemeStyles.getDefaultTextStyle().copyWith(
        color: LightThemeColors.kPrimaryTxtColor,
        fontSize: 18,
      ),
      bodyLarge: TextThemeStyles.getDefaultTextStyle().copyWith(
        fontSize: 16,
      ),
      bodyMedium: TextThemeStyles.getDefaultTextStyle(),
    );
  }
}
