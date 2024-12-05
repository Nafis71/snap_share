import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextThemeStyles {
  static TextStyle getDefaultTextStyle() {
    return TextStyle(
      fontFamily: "Satoshi",
      fontSize: kDefaultFontSize.sp,
      fontWeight: FontWeight.normal,
      color: const Color(0xFF101828),
    );
  }
}
