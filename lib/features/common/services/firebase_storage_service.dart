import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:snap_share/core/wrappers/logger.dart';

class FirebaseStorageService {
  Future<String?> uploadToStorageBucket({
    required String storagePath,
    required String id,
    required File file,
  }) async {
    try {
      logger.d("initiating upload");
      Reference storageReference = FirebaseStorage.instance
          .ref()
          .child("$storagePath/$id/${DateTime.now().microsecondsSinceEpoch}");
      UploadTask uploadTask = storageReference.putFile(file);
      await uploadTask.whenComplete(() {});
      return await storageReference.getDownloadURL();
    } catch (exception) {
      logger.e(exception);
      return null;
    }
  }
}
