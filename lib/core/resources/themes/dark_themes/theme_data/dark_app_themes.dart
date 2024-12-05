import 'package:flutter/material.dart';
import 'package:snap_share/core/resources/themes/dark_themes/themes/dark_app_bar_theme.dart';
import 'package:snap_share/core/resources/themes/dark_themes/themes/dark_check_box_theme.dart';
import 'package:snap_share/core/resources/themes/dark_themes/themes/dark_divider_theme.dart';
import 'package:snap_share/core/resources/themes/dark_themes/themes/dark_elevated_button_theme.dart';
import 'package:snap_share/core/resources/themes/dark_themes/themes/dark_tab_bar_theme.dart';
import 'package:snap_share/core/resources/themes/dark_themes/themes/dark_text_from_field.dart';
import 'package:snap_share/core/utilities/exports/resource_export.dart';

class DarkAppThemes {
  static ThemeData themeData() {
    return ThemeData(
      primaryColor: AppColors.kPrimaryColor,
      scaffoldBackgroundColor: DarkThemeColors.kScaffoldBGColor,
      textTheme: DarkTextThemes.textTheme,
      elevatedButtonTheme: DarkElevatedButtonTheme.getTheme(),
      appBarTheme: DarkAppBarTheme.getTheme(),
      inputDecorationTheme: DarkTextFormField.getTheme(),
      checkboxTheme: DarkCheckBoxTheme.getTheme(),
      tabBarTheme: DarkTabBarTheme.getTheme(),
      dividerTheme: DarkDividerTheme.getTheme(),
    );
  }
}
