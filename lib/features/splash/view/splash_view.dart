import 'package:flutter/material.dart';
import 'package:snap_share/core/utilities/exports/resource_export.dart';
import 'package:snap_share/core/utilities/exports/wrapper_export.dart';
import 'package:snap_share/features/splash/utilities/splash_helper.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      //placeholder for now
      SplashHelper.moveToOnboard();
    });
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
                  width: 120,
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
