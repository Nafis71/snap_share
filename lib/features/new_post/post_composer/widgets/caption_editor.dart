import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:snap_share/features/new_post/post_composer/view_model/post_composer_vm.dart';

import '../../../common/widgets/custom_text_field.dart';
import '../utilities/post_composer_strings.dart';

class CaptionEditor extends StatelessWidget {
  final PostComposerVM postComposerVM;
  const CaptionEditor({super.key, required this.postComposerVM});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Flexible(
          child: FutureBuilder(
            future: postComposerVM.newPostVM.selectedPhoto?.value
                ?.thumbnailDataWithSize(const ThumbnailSize(200, 200)),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return const SizedBox();
              }
              return RSizedBox(
                height: 90.h,
                width: 90.w,
                child: Image.memory(
                  snapshot.data!,
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ),
        const Gap(10),
        Expanded(
          flex: 2,
          child: RSizedBox(
            height: 100.h,
            child: Container(
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      hintText: PostComposerStrings.kCaptionHintText,
                      formValidator: (v) => null,
                      controller:
                      postComposerVM.captionController.value,
                      isDark: false,
                      prefixIconPath: null,
                      disableBorder: true,
                      maxLines: 5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
