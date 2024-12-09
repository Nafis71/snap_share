import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snap_share/core/resources/colors/app_colors.dart';
import 'package:snap_share/features/home/models/story.dart';
import 'package:snap_share/features/home/view/story_details_view.dart';
import 'package:snap_share/features/home/view_model/story_details_vm.dart';
import 'package:snap_share/features/home/widgets/add_story_dialog.dart';
import 'package:snap_share/features/home/widgets/home_app_bar.dart';
import 'package:snap_share/features/home/widgets/post_card.dart';
import 'package:snap_share/features/home/widgets/story_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhisperWhite,
      appBar: const HomeAppBar(
        profileUrl: "https://picsum.photos/200?random=1",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildStoriesSection(context),
            _buildPostsList(),
          ],
        ),
      ),
    );
  }

  Widget _buildStoriesSection(BuildContext context) {
    if (Get.find<StoryDetailsVM>().stories.isEmpty) {
      return _buildAddStoryCard(context);
    }
    return Container(
      height: 160,
      width: double.infinity,
      color: AppColors.kWhiteColor,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: Get.find<StoryDetailsVM>().stories.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _buildAddStoryCard(context);
          }
          return _buildStoryCard(
            stories: Get.find<StoryDetailsVM>().stories,
            index: index,
          );
        },
      ),
    );
  }

  Widget _buildAddStoryCard(BuildContext context) {
    return StoryCard(
      onTap: () => addStoryDialog(context),
      widget: const Align(
        alignment: Alignment.center,
        child: Icon(
          Icons.add,
          color: AppColors.kWhisperWhite,
          size: 48,
        ),
      ),
      profileUrl: "https://picsum.photos/200?random=1",
      storyUrl: "https://picsum.photos/200?random=2",
      userName: 'You',
    );
  }

  Widget _buildStoryCard({
    required List<Story> stories,
    required int index,
  }) {
    return StoryCard(
      onTap: () {
        Get.to(
          StoryDetailsView(
            initialIndex: index,
          ),
        );
      },
      profileUrl: stories[index].profileImageUrl,
      storyUrl: stories[index].storyImageUrl,
      userName: stories[index].username,
    );
  }

  Widget _buildPostsList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView.builder(
        primary: false,
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) => const PostCard(),
      ),
    );
  }
}
