import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:snap_share/core/resources/assets/icons/icon_assets.dart';
import 'package:snap_share/core/resources/dimensions/paddings.dart';
import 'package:snap_share/core/utilities/exports/wrapper_export.dart';
import 'package:snap_share/features/common/utilities/image_picker_helper.dart';
import 'package:snap_share/features/common/utilities/strings.dart';

import '../../new_post/common/view_model/new_post_vm.dart';

class ImagePickerWidget extends StatelessWidget {
  const ImagePickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            Strings.kImagePickerDialogTitle,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
      content: RPadding(
        padding: EdgeInsets.all(Paddings.kSmallPadding).r,
        child: Row(
          children: [
            _buildPickerMethod(
              asset: IconAssets.kCameraIcon,
              onPressed: () => ImagePickerHelper.pickImage(
                ImageSelectionType.camera,
                Get.find<NewPostVM>(),
              ),
            ),
            const Gap(16),
            _buildPickerMethod(
              asset: IconAssets.kGalleryIcon,
              onPressed: () => ImagePickerHelper.pickImage(
                ImageSelectionType.gallery,
                Get.find<NewPostVM>(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPickerMethod({
    required String asset,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(Paddings.kSmallPadding).r,
        decoration: BoxDecoration(
          color: const Color(0xFFF9F9FA),
          borderRadius: BorderRadius.circular(8),
        ),
        child: SvgLoader(
          asset: asset,
          width: 70.w,
        ),
      ),
    );
  }
}
