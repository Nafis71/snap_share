import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextThemeStyles {
  static TextStyle getDefaultTextStyle({
    TextStyle? Function() fontFamily = GoogleFonts.inter,
  }) {
    return fontFamily()!.copyWith(
      fontSize: kDefaultFontSize,
      fontWeight: FontWeight.normal,
      color: const Color(0xFF101828),
    );
  }
}
