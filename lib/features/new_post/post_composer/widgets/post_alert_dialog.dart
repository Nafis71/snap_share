import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:snap_share/core/resources/assets/icons/icon_assets.dart';
import 'package:snap_share/core/resources/colors/app_colors.dart';
import 'package:snap_share/features/new_post/post_composer/utilities/post_composer_strings.dart';

class PostAlertDialog extends StatelessWidget {
  const PostAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12).r
      ),
      title: Column(
        children: [
          Image.asset(
            IconAssets.kInfoIcon,
            width: 34.w,
            height: 34.h,
          ),
          const Gap(16),
          Text(
            PostComposerStrings.kPostAlertTitle,
            style: Theme.of(context).textTheme.titleSmall,
          )
        ],
      ),
      content: const Text(
        PostComposerStrings.kPostAlertContent,
      ),
      actions: [
        RPadding(
          padding: const EdgeInsets.only(left: 10).r,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => Get.back(),
                child: Text(
                  PostComposerStrings.kPostAlertEditBtnTxt,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: AppColors.kPrimaryColor,
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ),
              RSizedBox(
                height: 36.h,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(PostComposerStrings.kPostAlertPostBtnTxt),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
