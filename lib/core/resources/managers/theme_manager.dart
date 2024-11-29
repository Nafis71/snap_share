import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeManager extends GetxController {
  final Rx<ThemeMode> _currentTheme = ThemeMode.system.obs;

  ThemeMode get currentTheme => _currentTheme.value;

  set setThemeMode(ThemeMode themeMode) {
    _currentTheme.value = themeMode;
  }

  Brightness getTheme(BuildContext context) {
    return MediaQuery.platformBrightnessOf(context);
  }
}
