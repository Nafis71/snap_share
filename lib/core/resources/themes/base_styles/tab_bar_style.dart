import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabBarStyle {
  static TabBarTheme getTabBarStyle() {
    return TabBarTheme(
      indicatorSize: TabBarIndicatorSize.label,
      indicatorColor: const Color(0xFF667085),
      labelColor: const Color(0xFF101828),
      unselectedLabelColor: const Color(0xFF101828),
      labelStyle: TextStyle(
        fontFamily: "Satoshi",
        fontWeight: FontWeight.bold,
        fontSize: 12.sp,
      ),
      unselectedLabelStyle: TextStyle(
        fontFamily: "Satoshi",
        fontWeight: FontWeight.bold,
        fontSize: 12.sp,
      ),
      dividerHeight: 1.7,
      dividerColor: const Color(0xFFEAECF0),
      tabAlignment: TabAlignment.center,
      splashFactory: NoSplash.splashFactory,
    );
  }
}
