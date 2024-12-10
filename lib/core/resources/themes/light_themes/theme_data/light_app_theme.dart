import 'package:flutter/material.dart';
import 'package:snap_share/core/resources/themes/light_themes/themes/light_app_bar_theme.dart';
import 'package:snap_share/core/resources/themes/light_themes/themes/light_check_box_theme.dart';
import 'package:snap_share/core/resources/themes/light_themes/themes/light_divider_theme.dart';
import 'package:snap_share/core/resources/themes/light_themes/themes/light_drop_down_menu_theme.dart';
import 'package:snap_share/core/resources/themes/light_themes/themes/light_icon_button_theme.dart';
import 'package:snap_share/core/resources/themes/light_themes/themes/light_icon_theme.dart';
import 'package:snap_share/core/resources/themes/light_themes/themes/light_tab_bar_theme.dart';
import 'package:snap_share/core/resources/themes/light_themes/themes/light_text_button_theme.dart';
import 'package:snap_share/core/resources/themes/light_themes/themes/light_text_form_field.dart';
import 'package:snap_share/core/utilities/exports/resource_export.dart';

class LightAppThemes {
  static ThemeData themeData() {
    return ThemeData(
      primaryColor: AppColors.kPrimaryColor,
      scaffoldBackgroundColor: LightThemeColors.kScaffoldBGColor,
      textTheme: LightTextThemes.textTheme,
      elevatedButtonTheme: LightElevatedButtonTheme.getTheme(),
      appBarTheme: LightAppBarTheme.getTheme(),
      inputDecorationTheme: LightTextFormField.getTheme(),
      checkboxTheme: LightCheckBoxTheme.getTheme(),
      tabBarTheme: LightTabBarTheme.getTabBarTheme(),
      dividerTheme: LightDividerTheme.getTheme(),
      iconTheme: LightIconTheme.getTheme(),
      dropdownMenuTheme: LightDropDownMenuTheme.getTheme(),
      iconButtonTheme: LightIconButtonTheme.getTheme(),
      textButtonTheme: LightTextButtonTheme.getTheme(),
    );
  }
}
