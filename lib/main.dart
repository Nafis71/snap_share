import 'package:flutter/cupertino.dart';
import 'package:snap_share/app/app.dart';

import 'core/utilities/di/dependency_injection.dart';

main() {
  DependencyInjection.init();
  runApp(const SnapShare());
}
