import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snap_share/core/utilities/exports/resource_export.dart';
import 'package:snap_share/core/utilities/exports/wrapper_export.dart';

import '../view_model/splash_vm.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Get.find<SplashVM>().moveToOnboarding();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(Paddings.kScreenAllPadding),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              AppWidgetAnimator(
                widgetRestingEffects: WidgetRestingEffects.wave(
                  effectStrength: 1.2,
                  delay: const Duration(seconds: 1),
                ),
                widget: Image.asset(
                  ImageAssets.kAppLogo,
                  width: Sizes.kAppLogoSmallSize,
                ),
              ),
              const Spacer(),
              const AnimationLoader(
                asset: LottieAssets.kAnimatedLoader,
                width: 150,
              )
            ],
          ),
        ),
      ),
    );
  }
}
