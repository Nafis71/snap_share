import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';

import '../view_model/new_post_vm.dart';

class AlbumDropdown extends StatelessWidget {
  const AlbumDropdown({
    super.key,
    required this.newPostVM,
  });

  final NewPostVM newPostVM;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: 45.h,
        color: Colors.white,
        alignment: Alignment.center,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Gap(20),
            DropdownButton<AssetPathEntity>(
              isExpanded: false,
              dropdownColor: Colors.white,
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                fontFamily: "Satoshi",
              ),
              icon: const SizedBox.shrink(),
              underline: const SizedBox.shrink(),
              value: newPostVM.selectedAlbum!.value,
              items: newPostVM.albums.map(
                (album) {
                  return DropdownMenuItem<AssetPathEntity>(
                    value: album,
                    child: Row(
                      children: [
                        Text("${album.name} "),
                        const Gap(10),
                        const Icon(CupertinoIcons.chevron_down)
                      ],
                    ),
                  );
                },
              ).toList(),
              onChanged: (album) {
                newPostVM.selectedAlbum?.value = album;
                if (album != null) newPostVM.fetchImages(album);
              },
            )
          ],
        ),
      ),
    );
  }
}
