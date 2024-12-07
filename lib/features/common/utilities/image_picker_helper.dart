import 'package:get/get.dart';
import 'package:snap_share/core/utilities/exports/route_export.dart';
import 'package:snap_share/features/new_post/common/view_model/new_post_vm.dart';

enum ImageSelectionType { camera, gallery }

class ImagePickerHelper {
  static Future<void> pickImage(
      ImageSelectionType imageSelectionType, NewPostVM newPostVM) async {
    switch (imageSelectionType) {
      case ImageSelectionType.camera:
        bool status = await newPostVM.pickImage();
        Get.back();
        if (status) {
          Get.toNamed(RoutesNames.kPostComposerView)?.then(
            (_) {
              newPostVM.resetSelectedPhoto();
            },
          );
        }
      case ImageSelectionType.gallery:
        Get.back();
        Get.toNamed(RoutesNames.kMediaSelectionView);
    }
  }
}
