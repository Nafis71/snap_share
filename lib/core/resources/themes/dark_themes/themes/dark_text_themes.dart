import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snap_share/core/utilities/exports/resource_export.dart';

class DarkTextThemes {
  static TextTheme get textTheme {
    return TextTheme(
      titleLarge: TextThemeStyles.getDefaultTextStyle(fontFamily: GoogleFonts.lobster).copyWith(
        color: DarkThemeColors.kPrimaryTxtColor,
        fontSize: 26,
      ),
      titleMedium: TextThemeStyles.getDefaultTextStyle().copyWith(
        color: DarkThemeColors.kPrimaryTxtColor,
        fontSize: 18,
      ),
    );
  }
}
