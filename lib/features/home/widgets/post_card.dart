import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:snap_share/core/utilities/exports/resource_export.dart';
import 'package:snap_share/features/common/widgets/custom_icon_button.dart';
import 'package:snap_share/features/common/widgets/image_widget.dart';
import 'package:snap_share/features/home/widgets/comment_bottom_sheet.dart';
import 'package:snap_share/features/home/widgets/profile_with_border.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                const ProfileWithBorder(
                  profileUrl: "https://picsum.photos/200?random=1",
                ),
                const Gap(8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Snap Share",
                      style: textTheme.titleMedium,
                    ),
                    Text(
                      "@snapshare460",
                      style: textTheme.bodyLarge,
                    ),
                  ],
                ),
                const Spacer(),
                CustomSvgIconButton(
                  onPressed: () {},
                  iconPath: IconAssets.kNotificationIcon,
                ),
              ],
            ),
            const Gap(12),
            const ImageWidget(
              height: 300,
              width: double.infinity,
              radius: 16,
              imageProvider: NetworkImage("https://picsum.photos/200?random=1"),
            ),
            const Gap(12),
            Row(
              children: [
                CustomSvgIconButton(
                  iconBgColor: Colors.transparent,
                  onPressed: () {},
                  iconPath: IconAssets.kLoveRectIcon,
                ),
                CustomSvgIconButton(
                  iconBgColor: Colors.transparent,
                  onPressed: () {
                    showCommentsBottomSheet(
                      context: context,
                    );
                  },
                  iconPath: IconAssets.kCommentIcon,
                ),
                const Gap(8),
                Text(
                  "20 Comments",
                  style: textTheme.bodyLarge,
                ),
                const Spacer(),
                CustomSvgIconButton(
                  iconBgColor: Colors.transparent,
                  onPressed: () {},
                  iconPath: IconAssets.kBookmarkIcon,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
