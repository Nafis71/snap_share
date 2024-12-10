import 'package:flutter/material.dart';
import 'package:snap_share/core/utilities/exports/resource_export.dart';

class TextButtonStyle {
  static ButtonStyle getDefaultStyle() {
    return TextButton.styleFrom(
      foregroundColor: AppColors.kPrimaryColor,
      textStyle: TextThemeStyles.getDefaultTextStyle().copyWith(
        color: AppColors.kPrimaryColor,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
