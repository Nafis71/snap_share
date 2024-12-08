import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:snap_share/core/resources/managers/theme_manager.dart';
import 'package:snap_share/core/utilities/exports/resource_export.dart';
import 'package:snap_share/features/new_post/media_selection/utilities/media_selection_helper.dart';

import '../../common/view_model/new_post_vm.dart';

class AlbumDropdown extends StatelessWidget {
  final ThemeManager themeManager;

  const AlbumDropdown({
    super.key,
    required this.newPostVM,
    required this.themeManager,
  });

  final NewPostVM newPostVM;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (newPostVM.photos.isEmpty) {
          return const SizedBox.shrink();
        }
        return Container(
          height: 45.h,
          color: (themeManager.isDarkMode(context))
              ? DarkThemeColors.kComponentBGColor
              : LightThemeColors.kScaffoldBGColor,
          alignment: Alignment.center,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Gap(20),
              DropdownButton<AssetPathEntity>(
                isExpanded: false,
                dropdownColor: (themeManager.isDarkMode(context))
                    ? DarkThemeColors.kComponentBGColor
                    : LightThemeColors.kScaffoldBGColor,
                style: Theme.of(context).textTheme.titleSmall,
                icon: const SizedBox.shrink(),
                underline: const SizedBox.shrink(),
                value: newPostVM.selectedAlbum!.value,
                items: newPostVM.albums.map(
                  (album) {
                    return DropdownMenuItem<AssetPathEntity>(
                      value: album,
                      child: Row(
                        children: [
                          Text(album.name),
                          const Gap(10),
                          const Icon(CupertinoIcons.chevron_down)
                        ],
                      ),
                    );
                  },
                ).toList(),
                onChanged: (album) => MediaSelectionHelper.changeAlbum(
                  album,
                  newPostVM,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
