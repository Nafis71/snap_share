import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:snap_share/core/utilities/exports/route_export.dart';
import 'package:snap_share/features/authentication/profile_setup/view_model/profile_setup_vm.dart';

class ProfileSetupHelper {
  static Future<void> onNextPressed(ProfileSetupVM profileSetupVM) async {
    profileSetupVM.pageController.nextPage(
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeIn,
    );
    profileSetupVM.completedStep.toggle();
    if (profileSetupVM.pageController.page == 1) {
      await profileSetupVM.initiateProfileCreation();
      Get.offNamed(RoutesNames.kMainBottomNavView);
    }
  }
}
