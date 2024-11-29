import 'package:flutter/material.dart';
import 'package:snap_share/core/resources/colors/app_colors.dart';

class CheckBoxStyle {
  static CheckboxThemeData getDefaultStyle() {
    return CheckboxThemeData(
      checkColor: const WidgetStatePropertyAll(Colors.white),
      fillColor: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.kSecondaryColor;
          }
          return Colors.white;
        },
      ),
    );
  }
}
