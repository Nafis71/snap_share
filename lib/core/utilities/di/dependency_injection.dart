import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:snap_share/core/resources/managers/theme_manager.dart';
import 'package:snap_share/features/authentication/common/view_model/auth_vm.dart';
import 'package:snap_share/features/authentication/profile_setup/view_model/profile_setup_vm.dart';
import 'package:snap_share/features/common/services/firebase_storage_service.dart';
import 'package:snap_share/features/common/services/image_picker_service.dart';
import 'package:snap_share/features/common/view_model/profile_vm.dart';
import 'package:snap_share/features/home/view_model/home_vm.dart';
import 'package:snap_share/features/home/view_model/story_details_vm.dart';
import 'package:snap_share/features/new_post/common/services/gallery_service.dart';
import 'package:snap_share/features/new_post/post_composer/view_model/post_composer_vm.dart';

import '../../../features/authentication/common/services/auth_service.dart';
import '../../../features/main_bottom_nav/view_model/main_bottom_nav_vm.dart';
import '../../../features/new_post/common/view_model/new_post_vm.dart';

class DependencyInjection {
  static void init() {
    Get.put<ThemeManager>(ThemeManager(), permanent: true);
    Get.put<ProfileVM>(ProfileVM());
    Get.put<AuthVM>(
      AuthVM(
        AuthService(FirebaseAuth.instance, FirebaseFirestore.instance),
        Get.find<ProfileVM>(),
      ),
      permanent: true,
    );
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
      fenix: true,
    );
    Get.lazyPut(() => PostComposerVM(Get.find<NewPostVM>()), fenix: true);
    Get.lazyPut<ProfileSetupVM>(
      () => ProfileSetupVM(
        ImagePickerService(),
        Get.find<AuthVM>(),
        FirebaseStorageService(),
      ),
      fenix: true,
    );
    Get.lazyPut<HomeVM>(
      () => HomeVM(),
      fenix: true,
    );
    Get.lazyPut<StoryDetailsVM>(
      () => StoryDetailsVM(),
      fenix: true,
    );
  }
}
