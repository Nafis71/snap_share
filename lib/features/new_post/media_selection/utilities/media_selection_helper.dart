import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:snap_share/features/new_post/common/view_model/new_post_vm.dart';

class MediaSelectionHelper {
  static NewPostVM newPostVM = Get.find();

  static Future<void> fetchGallery() async {
    await newPostVM.fetchGalleryImage();
  }

  static void selectPhoto(int index) {
    newPostVM.selectedPhoto!.value = newPostVM.photos[index];
  }

  static void changeAlbum(AssetPathEntity? album) {
    newPostVM.selectedAlbum?.value = album;
    if (album != null) newPostVM.fetchImages(album);
  }
}
