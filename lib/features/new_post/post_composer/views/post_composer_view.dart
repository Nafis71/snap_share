import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_share/core/resources/dimensions/paddings.dart';
import 'package:snap_share/core/utilities/exports/widget_export.dart';
import 'package:snap_share/features/new_post/post_composer/utilities/post_composer_helper.dart';
import 'package:snap_share/features/new_post/post_composer/utilities/post_composer_strings.dart';
import 'package:snap_share/features/new_post/post_composer/view_model/post_composer_vm.dart';
import 'package:snap_share/features/new_post/post_composer/widgets/caption_editor.dart';
import 'package:snap_share/features/new_post/post_composer/widgets/location_selector.dart';

import '../../../../core/resources/colors/app_colors.dart';

class PostComposerView extends StatelessWidget {
  final PostComposerVM postComposerVM;

  const PostComposerView({super.key, required this.postComposerVM});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: PostComposerStrings.kPostComposerTitle,
        trailingWidget: [
          RPadding(
            padding: const EdgeInsets.only(right: 10).r,
            child: GestureDetector(
              onTap: () => PostComposerHelper.showPostAlertDialog(context),
              child: Row(
                children: [
                  Text(
                    PostComposerStrings.kPostBtnTxt,
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
            ),
          )
        ],
      ),
      body: RPadding(
        padding: EdgeInsets.all(Paddings.kScreenAllPadding).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CaptionEditor(postComposerVM: postComposerVM),
            const Divider(
              thickness: 2,
            ),
            const LocationSelector(),
            const Divider(
              thickness: 2,
            ),
          ],
        ),
      ),
    );
  }
}
