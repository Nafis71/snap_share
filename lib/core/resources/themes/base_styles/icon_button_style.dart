import 'package:flutter/material.dart';
import '../../colors/app_colors.dart';

class IconButtonStyle {
  static ButtonStyle getDefaultStyle() {
    return IconButton.styleFrom(
      backgroundColor: AppColors.kPaleBlue,
    );
  }
}
