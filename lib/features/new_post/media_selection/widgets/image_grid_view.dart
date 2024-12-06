import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:snap_share/core/utilities/exports/widget_export.dart';
import 'package:snap_share/features/new_post/media_selection/utilities/media_selection_helper.dart';

import '../../common/view_model/new_post_vm.dart';

class ImageGridView extends StatelessWidget {
  const ImageGridView({
    super.key,
    required this.newPostVM,
  });

  final NewPostVM newPostVM;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GridView.builder(
        padding: const EdgeInsets.all(0),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200, mainAxisSpacing: 0, crossAxisSpacing: 0),
        itemCount: newPostVM.photos.length,
        itemBuilder: (context, index) {
          return FutureBuilder(
            future: newPostVM.photos[index]
                .thumbnailDataWithSize(const ThumbnailSize(200, 200)),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: ActivityIndicatorCircular(color: Colors.black,));
              }
              return GestureDetector(
                onTap: () {
                  MediaSelectionHelper.selectPhoto(index, newPostVM);
                },
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: MemoryImage(snapshot.data!, scale: 1),
                      fit: BoxFit.cover,
                    ),
                  ),
                  alignment: Alignment.bottomRight,
                  child: Obx(
                    () => Checkbox(
                      shape: const CircleBorder(),
                      side: const BorderSide(color: Colors.black, width: 0.5),
                      value: newPostVM.selectedPhoto?.value!.id ==
                          newPostVM.photos[index].id,
                      onChanged: (_) {},
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
