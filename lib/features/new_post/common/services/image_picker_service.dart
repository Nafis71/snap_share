import 'package:image_picker/image_picker.dart';
import 'package:snap_share/core/wrappers/logger.dart';

class ImagePickerService {
  Future<String?> pickImage() async {
    String? imagePath;
    try {
      ImagePicker imagePicker = ImagePicker();
      XFile? imageFile =
          await imagePicker.pickImage(source: ImageSource.camera);
      if (imageFile != null) {
        imagePath = imageFile.path;
      }
    } catch (exception) {
      logger.e(exception);
    }
    return imagePath;
  }
}
