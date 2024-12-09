import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snap_share/features/home/view_model/story_details_vm.dart';

class StoryDetailsView extends StatelessWidget {
  final int initialIndex;

  const StoryDetailsView({
    super.key,
    required this.initialIndex,
  });

  @override
  Widget build(BuildContext context) {
    final StoryDetailsVM storyDetailsVM = Get.put(StoryDetailsVM());
    storyDetailsVM.setCurrentStoryIndex(initialIndex);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Obx(() => _buildStoryContent(storyDetailsVM)),
          _buildProgressBar(storyDetailsVM),
          _buildNavigationButtons(
            storyDetailsVM: storyDetailsVM,
            context: context,
          ),
        ],
      ),
    );
  }

  Widget _buildStoryContent(StoryDetailsVM storyDetailsVM) {
    return Image.network(
      storyDetailsVM.stories[storyDetailsVM.currentIndex.value].storyImageUrl,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    );
  }

  Widget _buildProgressBar(StoryDetailsVM storyDetailsVM) {
    return Positioned(
      top: 40,
      left: 16,
      right: 16,
      child: Row(
        children: storyDetailsVM.stories.map(
          (story) {
            int index = storyDetailsVM.stories.indexOf(story);
            return Expanded(
              child: Obx(
                () => LinearProgressIndicator(
                  value: index == storyDetailsVM.currentIndex.value
                      ? storyDetailsVM.progressValue.value
                      : (index < storyDetailsVM.currentIndex.value ? 1.0 : 0.0),
                  backgroundColor: Colors.grey,
                  color: Colors.white,
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }

  Widget _buildNavigationButtons({
    required StoryDetailsVM storyDetailsVM,
    required BuildContext context,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapUp: (details) {
        if (details.localPosition.dx < MediaQuery.of(context).size.width / 2) {
          storyDetailsVM.moveToPreviousStory();
        } else {
          storyDetailsVM.moveToNextStory();
        }
      },
      onLongPressStart: (_) {
        storyDetailsVM.stopTimer();
      },
      onLongPressEnd: (_) {
        storyDetailsVM.startAutoProgress();
      },
      child: Container(
        color: Colors.transparent,
      ),
    );
  }
}
