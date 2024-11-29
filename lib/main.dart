import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_share/app/app.dart';

import 'core/utilities/di/dependency_injection.dart';

main() {
  DependencyInjection.init();
  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 832),
      builder: (_,child){
        return const SnapShare();
      },
    ),
  );
}
