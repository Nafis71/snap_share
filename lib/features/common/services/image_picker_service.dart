import 'package:image_picker/image_picker.dart';
import 'package:snap_share/core/wrappers/logger.dart';

class ImagePickerService {
  ImagePickerService._();

  static ImagePickerService? _instance;

  factory ImagePickerService() => _instance ??= ImagePickerService._();

  Future<String?> pickImage([ImageSource? imageSource]) async {
    String? imagePath;
    try {
      ImagePicker imagePicker = ImagePicker();
      XFile? imageFile = await imagePicker.pickImage(
        source: imageSource ?? ImageSource.camera,
      );
      if (imageFile != null) {
        imagePath = imageFile.path;
      }
    } catch (exception) {
      logger.e(exception);
    }
    return imagePath;
  }
}
