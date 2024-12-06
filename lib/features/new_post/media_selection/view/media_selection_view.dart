import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:snap_share/core/resources/colors/app_colors.dart';
import 'package:snap_share/core/utilities/exports/widget_export.dart';
import 'package:snap_share/features/new_post/media_selection/utilities/media_selection_helper.dart';
import 'package:snap_share/features/new_post/media_selection/utilities/media_selection_strings.dart';

import '../../common/view_model/new_post_vm.dart';
import '../widgets/album_dropdown.dart';
import '../widgets/image_grid_view.dart';
import '../widgets/selected_image_preview.dart';

class MediaSelectionView extends StatefulWidget {
  const MediaSelectionView({super.key});

  @override
  State<MediaSelectionView> createState() => _MediaSelectionViewState();
}

class _MediaSelectionViewState extends State<MediaSelectionView> {
  @override
  void initState() {
    MediaSelectionHelper.fetchGallery();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: MediaSelectionStrings.kMediaSelectionTitle,
        trailingWidget: [
          RPadding(
            padding: const EdgeInsets.only(right: 10).r,
            child: Row(
              children: [
                Text(
                  MediaSelectionStrings.kNextBtnTxt,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.kPrimaryColor,
                      fontWeight: FontWeight.bold),
                ),
                const Icon(
                  CupertinoIcons.right_chevron,
                  size: 20,
                  color: AppColors.kPrimaryColor,
                )
              ],
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Flexible(
            child: SelectedImagePreview(
              newPostVM: Get.find<NewPostVM>(),
            ),
          ),
          AlbumDropdown(newPostVM: Get.find<NewPostVM>()),
          Expanded(
            child: ImageGridView(
              newPostVM: Get.find<NewPostVM>(),
            ),
          )
        ],
      ),
    );
  }
}
