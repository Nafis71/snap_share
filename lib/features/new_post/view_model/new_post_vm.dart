import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:snap_share/core/services/gallery_service.dart';
import 'package:snap_share/core/services/image_picker_service.dart';
import 'package:snap_share/core/wrappers/logger.dart';
import 'package:snap_share/features/main_bottom_nav/view_model/main_bottom_nav_vm.dart';

class NewPostVM extends GetxController {
  final ImagePickerService imagePickerService;
  MainBottomNavVM mainBottomNavVM;
  RxList<AssetEntity> photos = <AssetEntity>[].obs;
  RxList<AssetPathEntity> albums = <AssetPathEntity>[].obs;
  Rxn<AssetPathEntity>? selectedAlbum = Rxn<AssetPathEntity>();
  Rxn<AssetEntity>? selectedPhoto = Rxn<AssetEntity>();
  final GalleryService _galleryService;
  String imagePath = "";

  NewPostVM(
      this.imagePickerService, this.mainBottomNavVM, this._galleryService);

  Future<void> fetchGalleryImage() async {
    albums.clear();
    photos.clear();
    albums.value = await _galleryService.fetchAlbums();
    selectedAlbum?.value = albums[0];
    fetchImages(selectedAlbum!.value!);
  }

  Future<void> fetchImages(AssetPathEntity selectedAlbum) async {
    photos.value = await _galleryService.fetchAlbumSpecificImage(
      selectedAlbum,
    );
    selectedPhoto?.value = photos[0];
    logger.d(selectedPhoto?.value);
    logger.d(photos[0]);
  }

  Future<void> pickImage() async {
    imagePath = await imagePickerService.pickImage() ?? "";
    if (imagePath.isNotEmpty) {
      mainBottomNavVM.hasPickedImage.toggle();
      mainBottomNavVM.onChangedIndex(TabIndex.newPost.index);
      Get.back();
    }
  }
}
