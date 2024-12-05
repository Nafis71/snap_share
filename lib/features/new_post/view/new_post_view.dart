import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:snap_share/core/resources/colors/app_colors.dart';
import 'package:snap_share/core/utilities/exports/widget_export.dart';
import 'package:snap_share/features/new_post/view_model/new_post_vm.dart';

import '../widgets/album_dropdown.dart';
import '../widgets/image_grid_view.dart';
import '../widgets/selected_image_preview.dart';

class NewPostView extends StatefulWidget {
  const NewPostView({super.key});

  @override
  State<NewPostView> createState() => _NewPostViewState();
}

class _NewPostViewState extends State<NewPostView> {
  final NewPostVM newPostVM = Get.find();

  @override
  void initState() {
    newPostVM.fetchGalleryImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "New Post",
        trailingWidget: [
          RPadding(
            padding: const EdgeInsets.only(right: 10).r,
            child: Row(
              children: [
                Text(
                  "Next",
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
          Flexible(child: SelectedImagePreview(newPostVM: newPostVM)),
          AlbumDropdown(newPostVM: newPostVM),
          Expanded(
            child: ImageGridView(newPostVM: newPostVM),
          )
        ],
      ),
    );
  }
}
