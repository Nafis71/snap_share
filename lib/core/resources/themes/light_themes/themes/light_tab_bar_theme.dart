import 'package:flutter/material.dart';
import 'package:snap_share/core/resources/themes/base_styles/tab_bar_style.dart';

class LightTabBarTheme {
  static TabBarTheme getTabBarTheme() {
    return TabBarStyle.getTabBarStyle().copyWith();
  }
}
