import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snap_share/export_file.dart';
import 'package:snap_share/features/auth/splash/view_model/splash_view_model.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Get.find<SplashViewModel>().moveToOnboarding();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(Paddings.screenAllPadding),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              AppLogo(appName: SplashStrings.appNameTxt),
              Spacer(),
              SplashFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
