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

  NewPostVM(
    this.imagePickerService,
    this.mainBottomNavVM,
    this._galleryService,
  );

  Future<void> fetchGalleryImage() async {
    try {
      await _fetchAlbums();
      selectedAlbum?.value = (albums.isNotEmpty) ? albums[0] : null;
      if (selectedAlbum?.value != null) {
        fetchImages(selectedAlbum!.value!);
      }
    } catch (exception) {
      logger.e(exception);
    }
  }

  Future<void> _fetchAlbums() async {
    albums.assignAll(await _galleryService.fetchAlbums());
  }

  Future<void> fetchImages(AssetPathEntity selectedAlbum) async {
    photos.assignAll(
      await _galleryService.fetchAlbumSpecificImage(
        selectedAlbum,
      ),
    );
    selectedPhoto?.value = (photos.isNotEmpty) ? photos[0] : null;
  }

  Future<void> pickImage() async {
    String imagePath = await imagePickerService.pickImage() ?? "";
    if (imagePath.isNotEmpty) {
      mainBottomNavVM.hasPickedImage.toggle();
      mainBottomNavVM.onChangedIndex(TabIndex.newPost.index);
      Get.back();
    }
  }
}
