import 'dart:io';

import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:snap_share/core/wrappers/logger.dart';
import 'package:snap_share/features/main_bottom_nav/view_model/main_bottom_nav_vm.dart';
import 'package:snap_share/features/new_post/common/services/gallery_service.dart';
import 'package:snap_share/features/new_post/common/services/image_picker_service.dart';

class NewPostVM extends GetxController {
  final ImagePickerService _imagePickerService;
  MainBottomNavVM mainBottomNavVM;
  RxList<AssetEntity> photos = <AssetEntity>[].obs;
  RxList<AssetPathEntity> albums = <AssetPathEntity>[].obs;
  Rxn<AssetPathEntity>? selectedAlbum = Rxn<AssetPathEntity>();
  final Rxn<AssetEntity> _selectedPhoto = Rxn<AssetEntity>();
  final GalleryService _galleryService;
  File? _imageFile;

  NewPostVM(
    this._imagePickerService,
    this.mainBottomNavVM,
    this._galleryService,
  );

  File? get imagePath => _imageFile;

  Rxn<AssetEntity>? get selectedPhoto => _selectedPhoto;

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
    _selectedPhoto.value = (photos.isNotEmpty) ? photos[0] : null;
  }

  Future<bool> pickImage() async {
    String imagePath = await _imagePickerService.pickImage() ?? "";
    if (imagePath.isNotEmpty) {
      _imageFile = File(imagePath);
      return true;
    }
    return false;
  }
}
