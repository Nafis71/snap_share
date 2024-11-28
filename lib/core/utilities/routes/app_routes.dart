import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snap_share/core/utilities/exports/route_export.dart';
import 'package:snap_share/features/onboarding/view/onboarding_view.dart';


class AppRoutes {
  static List<GetPage<dynamic>> appRoutes() {
    return [
      _getPage(
        routeName: RoutesNames.onboardingView,
        page: const OnboardingView(),
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
