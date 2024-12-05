import 'package:flutter/material.dart';
import 'package:snap_share/core/resources/themes/base_styles/tab_bar_style.dart';

class DarkTabBarTheme {
  static TabBarTheme getTheme() {
    return TabBarStyle.getTabBarStyle().copyWith(
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white,
        dividerColor: const Color(0xFF465366),
        indicatorColor: Colors.white);
  }
}
