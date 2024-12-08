import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:snap_share/features/authentication/profile_setup/view_model/profile_setup_vm.dart';

class ProfileSetupHelper {
  static void onNextPressed(ProfileSetupVM profileSetupVM) {
    profileSetupVM.pageController.nextPage(
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeIn,
    );
    profileSetupVM.completedStep.toggle();
    if (profileSetupVM.pageController.page == 1) {
      profileSetupVM.initiateProfileCreation();
    }
  }
}
