import 'package:flutter/material.dart';
import 'package:snap_share/core/resources/themes/base_styles/divider_style.dart';

import '../../../colors/dark_theme_colors.dart';

class DarkDividerTheme {
  static DividerThemeData getTheme() {
    return DividerStyle.getDividerStyle().copyWith(
      color: DarkThemeColors.kScaffoldBGColor,
    );
  }
}
