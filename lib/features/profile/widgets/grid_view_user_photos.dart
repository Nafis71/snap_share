import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:snap_share/core/resources/dimensions/paddings.dart';
import 'package:snap_share/core/wrappers/custom_cached_image.dart';
import 'package:snap_share/features/common/view_model/profile_vm.dart';
import 'package:snap_share/features/common/widgets/image_widget.dart';

class GridViewUserPhotos extends StatelessWidget {
  final ProfileVM profileVm;

  const GridViewUserPhotos({super.key, required this.profileVm});

  @override
  Widget build(BuildContext context) {
    // Temporary photo list
    final List<Map<String, String>> userPhotos = List.generate(
      20,
      (index) => {'imageUrl': 'https://picsum.photos/200?random=$index'},
    );
    return RPadding(
      padding: EdgeInsets.only(
              left: Paddings.kSmallPadding,
              right: Paddings.kSmallPadding,
              top: Paddings.kSmallPadding)
          .r,
      child: GridView.custom(
        gridDelegate: SliverQuiltedGridDelegate(
          crossAxisCount: 4,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          repeatPattern: QuiltedGridRepeatPattern.inverted,
          pattern: [
            const QuiltedGridTile(2, 2),
            const QuiltedGridTile(1, 1),
            const QuiltedGridTile(1, 1),
            const QuiltedGridTile(1, 2),
          ],
        ),
        childrenDelegate: SliverChildBuilderDelegate(
          childCount: userPhotos.length,
          (context, index) => CustomCachedImage(
            imageUrl: userPhotos[index]['imageUrl']!,
            borderRadius: BorderRadius.circular(8),
            imageProviderWidget: (ImageProvider imageProvider) {
              return ImageWidget(
                imageProvider: imageProvider,
              );
            },
          ),
        ),
      ),
    );
  }
}
