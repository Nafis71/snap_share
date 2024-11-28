import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:snap_share/core/utilities/exports/resource_export.dart';
import 'package:snap_share/core/utilities/exports/route_export.dart';
import 'package:snap_share/features/onboarding/view/onboarding_view.dart';

class SnapShare extends StatelessWidget {
  const SnapShare({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 832),
      builder: (_, child){
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: const OnboardingView(),
          getPages: AppRoutes.appRoutes(),
          theme: LightAppThemes.themeData(),
          darkTheme: DarkAppThemes.themeData(),
          themeMode: ThemeMode.system,
        );
      },
    );
  }
}
