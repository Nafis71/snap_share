import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:snap_share/core/wrappers/custom_cached_image.dart';
import 'package:snap_share/features/common/widgets/image_widget.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({
    super.key,
    required this.profileUrl,
    required this.userName,
    required this.userID,
    this.totalPost = 0,
    this.followings = 0,
    this.followers = 0,
  });

  final String profileUrl;
  final String userName;
  final String userID;
  final int totalPost;
  final int followings;
  final int followers;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      height: 100,
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomCachedImage(
            imageUrl: profileUrl,
            imageProviderWidget: (ImageProvider imageProvider) {
              return ImageWidget(
                imageProvider: imageProvider,
              );
            },
            borderRadius: BorderRadius.circular(100),
            height: 85,
            width: 85,
          ),
          const Gap(8),
          Expanded(
            child: FittedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    userName,
                    style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold, fontSize: 16.sp),
                  ),
                  const Gap(2),
                  Text(
                    userID,
                    style: textTheme.bodyMedium,
                  ),
                  const Gap(8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildProfileStats("$totalPost Post", textTheme),
                      const Gap(16),
                      _buildProfileStats("$followings Following", textTheme),
                      const Gap(16),
                      _buildProfileStats("$followers Followers", textTheme),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Text _buildProfileStats(String text, TextTheme textTheme) {
    return Text(
      text,
      style: textTheme.bodyMedium,
    );
  }
}
