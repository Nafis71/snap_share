import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeManager extends GetxController{
  final Rx<ThemeMode> _currentTheme = ThemeMode.dark.obs;

  ThemeMode get currentTheme => _currentTheme.value;

  set setThemeMode(ThemeMode themeMode){
    _currentTheme.value = themeMode;
  }
}