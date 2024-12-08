import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snap_share/core/utilities/exports/route_export.dart';
import 'package:snap_share/features/authentication/profile_setup/view/profile_setup_view.dart';
import 'package:snap_share/features/authentication/signup/view/sign_up_view.dart';
import 'package:snap_share/features/main_bottom_nav/view/main_bottom_nav_view.dart';
import 'package:snap_share/features/new_post/media_selection/view/media_selection_view.dart';
import 'package:snap_share/features/new_post/post_composer/views/post_composer_view.dart';
import 'package:snap_share/features/onboarding/view/onboarding_view.dart';
import 'package:snap_share/features/splash/view/splash_view.dart';

import '../../../features/authentication/signIn/view/sign_in_view.dart';

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
        routeName: RoutesNames.kSignInView,
        page: const SignInView(),
      ),
      _getPage(
        routeName: RoutesNames.kSignUpView,
        page: const SignUpView(),
      ),
      _getPage(
        routeName: RoutesNames.kProfileSetupView,
        page: const ProfileSetupView(),
      ),
      _getPage(
        routeName: RoutesNames.kMainBottomNavView,
        page: const MainBottomNavView(),
      ),
      _getPage(
        routeName: RoutesNames.kMediaSelectionView,
        page: const MediaSelectionView(),
      ),
      _getPage(
        routeName: RoutesNames.kPostComposerView,
        page: const PostComposerView(),
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
