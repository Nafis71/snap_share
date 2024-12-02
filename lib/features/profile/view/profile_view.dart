import 'package:flutter/material.dart';
import 'package:snap_share/core/utilities/exports/resource_export.dart';
import 'package:snap_share/features/profile/utilities/constants/profile_strings.dart';
import 'package:snap_share/features/profile/widgets/profile_section.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: _buildAppBar(context, textTheme),
      body: const Column(
        children: [
          ProfileSection(
            profileUrl: ImageAssets.kDummyProfile,
            userName: "Snap Share",
            userID: "@snapshare460",
            totalPost: 59,
            followings: 125,
            followers: 860,
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context, TextTheme textTheme) {
    return AppBar(
      centerTitle: true,
      title: Text(
        ProfileStrings.kAppBarTitle,
        style: textTheme.headlineLarge?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
