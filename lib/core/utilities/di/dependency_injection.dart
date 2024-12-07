import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:snap_share/core/resources/managers/theme_manager.dart';
import 'package:snap_share/features/authentication/common/view_model/auth_vm.dart';
import 'package:snap_share/features/new_post/common/services/gallery_service.dart';
import 'package:snap_share/features/new_post/common/services/image_picker_service.dart';
import 'package:snap_share/features/new_post/post_composer/view_model/post_composer_vm.dart';
import 'package:snap_share/features/profile/view_model/profile_vm.dart';

import '../../../features/authentication/common/services/auth_service.dart';
import '../../../features/main_bottom_nav/view_model/main_bottom_nav_vm.dart';
import '../../../features/new_post/common/view_model/new_post_vm.dart';

class DependencyInjection {
  static void init() {
    Get.put<ThemeManager>(ThemeManager(), permanent: true);
    Get.lazyPut<MainBottomNavVM>(
      () => MainBottomNavVM(),
      fenix: true,
    );
    Get.lazyPut<NewPostVM>(
        () => NewPostVM(
              ImagePickerService(),
              Get.find<MainBottomNavVM>(),
              GalleryService(),
            ),
        fenix: true);
    Get.lazyPut(() => PostComposerVM(Get.find<NewPostVM>()), fenix: true);
    Get.put<AuthVM>(
      AuthVM(AuthService(FirebaseAuth.instance)),
    );
    Get.lazyPut<ProfileVm>(() => ProfileVm(), fenix: true);
  }
}
