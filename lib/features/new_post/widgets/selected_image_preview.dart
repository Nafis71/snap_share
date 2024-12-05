import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';

import '../../common/widgets/activity_indicator.dart';
import '../view_model/new_post_vm.dart';

class SelectedImagePreview extends StatelessWidget {
  const SelectedImagePreview({
    super.key,
    required this.newPostVM,
  });

  final NewPostVM newPostVM;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (newPostVM.photos.isEmpty) {
          return const Center(
            child: ActivityIndicatorCircular(
              color: Colors.black,
            ),
          );
        }
        return FutureBuilder(
          future: newPostVM.selectedPhoto?.value
                  ?.thumbnailDataWithSize(const ThumbnailSize(1280, 720)) ??
              newPostVM.photos[0]
                  .thumbnailDataWithSize(const ThumbnailSize(1280, 720)),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: Icon(Icons.broken_image));
            }
            return RSizedBox(
              height: 0.35.sh,
              width: 1.sw,
              child: Image.memory(
                snapshot.data!,
                gaplessPlayback: true,
                filterQuality: FilterQuality.low,
                fit: BoxFit.cover,
              ),
            );
          },
        );
      },
    );
  }
}
