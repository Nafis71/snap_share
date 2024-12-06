import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:snap_share/core/utilities/exports/route_export.dart';
import 'package:snap_share/features/new_post/common/view_model/new_post_vm.dart';

class MediaSelectionHelper {

  static void selectPhoto(int index, NewPostVM newPostVM) {
    newPostVM.selectedPhoto!.value = newPostVM.photos[index];
  }

  static void changeAlbum(AssetPathEntity? album, NewPostVM newPostVM) {
    newPostVM.selectedAlbum?.value = album;
    if (album != null) newPostVM.fetchImages(album);
  }

  static void gotoPostComposer(NewPostVM newPostVM) {
    if (newPostVM.selectedPhoto != null) {
      Get.offNamed(RoutesNames.kPostComposerView);
      return;
    }
  }
}
