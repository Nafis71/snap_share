import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:snap_share/features/profile/utilities/constants/profile_strings.dart';
import 'package:snap_share/features/profile/widgets/grid_view_user_photos.dart';
import 'package:snap_share/features/profile/widgets/list_view_user_photos.dart';
import 'package:snap_share/features/profile/widgets/profile_section.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: _buildAppBar(context, textTheme),
        body: Column(
          children: [
            const ProfileSection(
              profileUrl: "https://picsum.photos/200?random=1",
              userName: "Snap Share",
              userID: "@snapshare460",
              totalPost: 59,
              followings: 125,
              followers: 860,
            ),
            Divider(
              color: Colors.grey.withOpacity(0.1),
              thickness: 10,
            ),
            _userPostsSection(),
          ],
        ),
      ),
    );
  }

  Widget _userPostsSection() {
    return Expanded(
      child: Column(
        children: [
          TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              _buildTab(
                icon: Icons.window,
                title: "Grid View",
              ),
              _buildTab(
                icon: Icons.list,
                title: "List View",
              ),
            ],
          ),
          const Expanded(
            child: TabBarView(
              children: [
                GridViewUserPhotos(),
                ListViewUserPhotos(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab({
    required IconData icon,
    required String title,
  }) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          const Gap(8),
          Text(title),
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