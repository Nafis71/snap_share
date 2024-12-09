import 'dart:async';

import 'package:get/get.dart';
import 'package:snap_share/features/home/models/story.dart';

class StoryDetailsVM extends GetxController {
  final List<Story> stories = [
    Story(
      storyImageUrl: 'https://picsum.photos/200?random=1',
      username: 'Snap Share 1',
      profileImageUrl: 'https://picsum.photos/200?random=2',
    ),
    Story(
      storyImageUrl: 'https://picsum.photos/200?random=2',
      username: 'Snap Share 2',
      profileImageUrl: 'https://picsum.photos/200?random=3',
    ),
    Story(
      storyImageUrl: 'https://picsum.photos/200?random=3',
      username: 'Snap Share 3',
      profileImageUrl: 'https://picsum.photos/200?random=4',
    ),
    Story(
      storyImageUrl: 'https://picsum.photos/200?random=4',
      username: 'Snap Share 4',
      profileImageUrl: 'https://picsum.photos/200?random=5',
    ),
    Story(
      storyImageUrl: 'https://picsum.photos/200?random=6',
      username: 'Snap Share 4',
      profileImageUrl: 'https://picsum.photos/200?random=6',
    ),
    Story(
      storyImageUrl: 'https://picsum.photos/200?random=6',
      username: 'Snap Share 4',
      profileImageUrl: 'https://picsum.photos/200?random=7',
    ),
  ];

  final RxInt currentIndex = 0.obs;
  final RxDouble progressValue = 0.0.obs;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    startAutoProgress();
  }

  void setCurrentStoryIndex(int index) {
    if (index >= 0 && index < stories.length) {
      currentIndex.value = index;
      resetProgress();
    }
  }

  void moveToNextStory() {
    if (currentIndex.value < stories.length - 1) {
      currentIndex.value++;
      resetProgress();
    } else {
      stopTimer();
    }
  }

  void moveToPreviousStory() {
    if (currentIndex.value > 0) {
      currentIndex.value--;
      resetProgress();
    }
  }

  void startAutoProgress() {
    _timer?.cancel();
    _timer = Timer.periodic(
      const Duration(milliseconds: 100),
      (timer) {
        progressValue.value += 0.01;
        if (progressValue.value >= 1.0) {
          moveToNextStory();
        }
      },
    );
  }

  void resetProgress() {
    progressValue.value = 0.0;
    startAutoProgress();
  }

  void stopTimer() {
    _timer?.cancel();
  }

  @override
  void onClose() {
    stopTimer();
    super.onClose();
  }

  bool isLastStory() {
    return currentIndex.value == stories.length - 1;
  }

  bool isFirstStory() {
    return currentIndex.value == 0;
  }
}
