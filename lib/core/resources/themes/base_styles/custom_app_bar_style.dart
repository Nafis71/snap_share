import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppBarStyle {
  static AppBarTheme getDefaultStyle() {
    return const AppBarTheme(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark));
  }
}
