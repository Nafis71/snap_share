import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:snap_share/core/utilities/exports/resource_export.dart';
import 'package:snap_share/core/wrappers/custom_cached_image.dart';

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
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(2),
                  Text(
                    userID,
                    style: _profileSectionFooterTextStyle(),
                  ),
                  const Gap(8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildProfileSectionFooterText("$totalPost Post"),
                      const Gap(16),
                      _buildProfileSectionFooterText("$followings Following"),
                      const Gap(16),
                      _buildProfileSectionFooterText("$followers Followers"),
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

  Text _buildProfileSectionFooterText(String text) {
    return Text(
      text,
      style: _profileSectionFooterTextStyle(),
    );
  }

  TextStyle _profileSectionFooterTextStyle() {
    return const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: AppColors.kBlackColor,
    );
  }
}
