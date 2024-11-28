import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_share/core/resources/themes/base_styles/text_theme_styles.dart';

import '../../colors/light_theme_colors.dart';

class ElevatedButtonStyle {
  static ButtonStyle getDefaultStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: LightThemeColors.kPrimaryColor,
      disabledBackgroundColor: LightThemeColors.kDisabledBtnColor,
      disabledForegroundColor: Colors.white,
      foregroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4).r,
      ),
      textStyle: TextThemeStyles.getDefaultTextStyle().copyWith(
          color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
    );
  }
}
