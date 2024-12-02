import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snap_share/core/utilities/exports/route_export.dart';
import 'package:snap_share/features/authentication/login/view/login_view.dart';
import 'package:snap_share/features/authentication/signup/view/sign_up_view.dart';
import 'package:snap_share/features/main_bottom_nav/view/main_bottom_nav_view.dart';
import 'package:snap_share/features/onboarding/view/onboarding_view.dart';
import 'package:snap_share/features/splash/view/splash_view.dart';

class AppRoutes {
  static List<GetPage<dynamic>> appRoutes() {
    return [
      _getPage(
        routeName: RoutesNames.kLandingPage,
        page: const SplashView(),
      ),
      _getPage(
        routeName: RoutesNames.kOnboardingView,
        page: const OnboardingView(),
      ),
      _getPage(
        routeName: RoutesNames.kLoginView,
        page: const LoginView(),
      ),
      _getPage(
        routeName: RoutesNames.kSignUpView,
        page: const SignUpView(),
      ),
      _getPage(
        routeName: RoutesNames.kMainBottomNavView,
        page: const MainBottomNavView(),
      ),
    ];
  }

  static GetPage<dynamic> _getPage(
      {required String routeName, required Widget page}) {
    return GetPage(
      name: routeName,
      page: () => page,
      transition: Transition.cupertino,
    );
  }
}
