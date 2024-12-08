import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:snap_share/core/resources/managers/theme_manager.dart';
import 'package:snap_share/core/utilities/exports/resource_export.dart';
import 'package:snap_share/core/utilities/exports/wrapper_export.dart';
import 'package:snap_share/features/common/utilities/image_picker_helper.dart';
import 'package:snap_share/features/common/utilities/strings.dart';

import '../../new_post/common/view_model/new_post_vm.dart';

class ImagePickerWidget extends StatelessWidget {
  const ImagePickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeManager themeManager = Get.find();
    return AlertDialog(
      backgroundColor: themeManager.isDarkMode(context)
          ? DarkThemeColors.kComponentBGColor
          : LightThemeColors.kScaffoldBGColor,
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
              themeManager: themeManager,
              context: context,
              onPressed: () => ImagePickerHelper.pickImage(
                ImageSelectionType.camera,
                Get.find<NewPostVM>(),
              ),
            ),
            const Gap(16),
            _buildPickerMethod(
              asset: IconAssets.kGalleryIcon,
              themeManager: themeManager,
              context: context,
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
    required ThemeManager themeManager,
    required BuildContext context,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(Paddings.kSmallPadding).r,
        decoration: BoxDecoration(
          color: themeManager.isDarkMode(context)
              ? DarkThemeColors.kAlertColorDialogComponentColor
              : LightThemeColors.kAlertColorDialogComponentColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: SvgLoader(
          asset: asset,
          width: 70.w,
          color: themeManager.isDarkMode(context) ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
