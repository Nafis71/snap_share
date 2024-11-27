import 'package:flutter/material.dart';
import 'package:snap_share/export_file.dart';

class TextThemeStyles {
  static TextStyle titleLargeTextStyle({required Color color}) {
    return TextStyle(
      fontSize: FontSizes.titleLargeTxtSize,
      fontWeight: FontWeight.bold,
      color: color,
    );
  }

  static TextStyle titleMediumTextStyle({required Color color}) {
    return TextStyle(
      fontSize: FontSizes.titleMediumTxtSize,
      fontWeight: FontWeight.bold,
      color: color,
    );
  }
}
