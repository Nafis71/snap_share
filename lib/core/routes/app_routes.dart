import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snap_share/export_file.dart';

class AppRoutes {
  static List<GetPage<dynamic>> appRoutes() {
    return [
      _getPage(
        routeName: RoutesNames.splashView,
        page: const SplashView(),
      ),
    ];
  }

  static GetPage<dynamic> _getPage(
      {required String routeName, required Widget page}) {
    return GetPage(
      name: routeName,
      page: () => page,
      transition: Transition.leftToRightWithFade,
    );
  }
}
