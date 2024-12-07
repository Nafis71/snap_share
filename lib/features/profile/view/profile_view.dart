import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snap_share/core/resources/managers/theme_manager.dart';
import 'package:snap_share/core/utilities/exports/resource_export.dart';
import 'package:snap_share/features/profile/utilities/constants/profile_strings.dart';
import 'package:snap_share/features/profile/view_model/profile_vm.dart';
import 'package:snap_share/features/profile/widgets/grid_view_user_photos.dart';
import 'package:snap_share/features/profile/widgets/profile_section.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late final ThemeManager themeManager;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    _tabController.animateTo(1);
    themeManager = Get.find();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ProfileSection(
            profileUrl: "https://picsum.photos/200?random=1",
            userName: "Snap Share",
            userID: "@snapshare460",
            totalPost: 59,
            followings: 125,
            followers: 860,
            isDarkMode: themeManager.isDarkMode(context),
          ),
          const Divider(
            thickness: 10,
          ),
          _userPhotosSection(context),
        ],
      ),
    );
  }

  Widget _userPhotosSection(BuildContext context) {
    return Expanded(
      child: Container(
        color: themeManager.isDarkMode(context)
            ? DarkThemeColors.kScaffoldBGColor
            : Colors.white,
        child: Column(
          children: [
            Container(
              color: themeManager.isDarkMode(context)
                  ? DarkThemeColors.kScaffoldBGColor
                  : Colors.white,
              child: TabBar(
                controller: _tabController,
                indicatorWeight: 0.01,
                padding: const EdgeInsets.all(0),
                tabs: const [
                  SizedBox.shrink(),
                  Tab(
                    text: ProfileStrings.kAllPostTabBarTxt,
                  ),
                  Tab(
                    text: ProfileStrings.kSavedPostTabBarTxt,
                  ),
                  SizedBox.shrink(),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  const SizedBox.shrink(),
                  GridViewUserPhotos(
                    profileVm: Get.find<ProfileVm>(),
                  ),
                  const SizedBox.shrink(),
                  const SizedBox.shrink(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
