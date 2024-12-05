import 'package:flutter/cupertino.dart';
import 'package:snap_share/core/resources/themes/base_styles/icon_style.dart';

class DarkIconTheme {
  static IconThemeData getTheme() {
    return IconStyle.getIconStyle().copyWith(color: CupertinoColors.white);
  }
}
