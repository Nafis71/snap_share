import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_share/core/resources/colors/light_theme_colors.dart';

import '../../colors/app_colors.dart';

class TextFormFieldStyle {
  static InputDecorationTheme getDefaultStyle() {
    return InputDecorationTheme(
      isDense: true,
      prefixIconColor: LightThemeColors.kTextFormFieldPrefixIconColor,
      prefixStyle: const TextStyle(
        color: Colors.black,
      ),
      hintStyle: TextStyle(
        color: LightThemeColors.kTextFormFieldHintColor,
        fontWeight: FontWeight.normal,
        fontSize: 14.sp,
      ),
      enabledBorder: getOutlineInputBorder(),
      focusedBorder: getOutlineInputBorder().copyWith(
        borderSide: const BorderSide(
          color: AppColors.kPrimaryColor,
          width: 1,
        ),
      ),
      errorBorder: getOutlineInputBorder().copyWith(
        borderSide: const BorderSide(
          color: LightThemeColors.kTextFormFieldErrorBorderColor,
          width: 1,
        ),
      ),
      focusedErrorBorder: getOutlineInputBorder().copyWith(
        borderSide: const BorderSide(
          color: LightThemeColors.kTextFormFieldErrorBorderColor,
          width: 2,
        ),
      ),
    );
  }

  static OutlineInputBorder getOutlineInputBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(
        color: LightThemeColors.kTextFormFieldEnabledBorderColor,
        width: 1,
      ),
    );
  }
}
