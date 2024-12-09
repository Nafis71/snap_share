import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_share/app/app.dart';
import 'package:snap_share/features/common/services/app_storage.dart';

import 'core/utilities/di/dependency_injection.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await AppStorage().init();
  DependencyInjection.init();
  runApp(DevicePreview(
    builder: (context) => ScreenUtilInit(
      designSize: const Size(375, 832),
      builder: (_, child) {
        return const SnapShare();
      },
    ),
  ));
}
