import 'package:photo_manager/photo_manager.dart';

class GalleryService {
  Future<List<AssetPathEntity>> fetchAlbums() async {
    PermissionState permissionState =
        await PhotoManager.requestPermissionExtend();
    if (permissionState.isAuth) {
      //fetch
      List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
        type: RequestType.image,
        onlyAll: false,
      );
      return albums;
    } else {
      PhotoManager.openSetting();
      return [];
    }
  }

  Future<List<AssetEntity>> fetchAlbumSpecificImage(
      AssetPathEntity album) async {
    return await album.getAssetListPaged(page: 0, size: 100);
  }
}
