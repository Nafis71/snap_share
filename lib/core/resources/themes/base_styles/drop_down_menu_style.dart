import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropDownMenuStyle {
  static DropdownMenuThemeData getStyle() {
    return DropdownMenuThemeData(
      menuStyle: MenuStyle(
        backgroundColor: WidgetStateProperty.resolveWith<Color>(
          (states) {
            return Colors.red;
          },
        ),
        fixedSize: WidgetStateProperty.resolveWith(
          (states) {
            return Size.fromWidth(20.w);
          },
        ),
      ),
    );
  }
}
