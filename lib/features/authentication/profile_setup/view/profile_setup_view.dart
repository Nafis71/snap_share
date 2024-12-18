import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:snap_share/core/utilities/exports/resource_export.dart';
import 'package:snap_share/features/authentication/profile_setup/utilities/profile_setup_helper.dart';
import 'package:snap_share/features/authentication/profile_setup/utilities/profile_setup_strings.dart';
import 'package:snap_share/features/authentication/profile_setup/view_model/profile_setup_vm.dart';
import 'package:snap_share/features/authentication/profile_setup/widgets/profile_picture_selection.dart';
import 'package:snap_share/features/authentication/profile_setup/widgets/profile_setup_final.dart';
import 'package:snap_share/features/authentication/profile_setup/widgets/user_details.dart';

class ProfileSetupView extends StatelessWidget {
  const ProfileSetupView({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileSetupVM profileSetupVM = Get.find();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 10,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Obx(
              () {
                if (!profileSetupVM.isLoading.value) {
                  return const SizedBox.shrink();
                }
                return const LinearProgressIndicator(
                  minHeight: 2,
                  color: AppColors.kPrimaryColor,
                );
              },
            ),
            Expanded(
              child: RPadding(
                padding: EdgeInsets.all(Paddings.kScreenAllPadding).r,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ProfileSetupStrings.kProfileSetupHeader,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const Gap(5),
                    Expanded(
                      child: PageView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: profileSetupVM.pageController,
                        children: [
                          ProfilePictureSelection(
                            profileSetupVM: profileSetupVM,
                          ),
                          UserDetails(
                            profileSetupVM: profileSetupVM,
                          ),
                          const ProfileSetupFinal(),
                        ],
                      ),
                    ),
                    // const ProfilePictureSelection(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Obx(
                          () {
                            if (profileSetupVM.pageController.page == 2) {
                              return const SizedBox.shrink();
                            }
                            return ElevatedButton(
                              onPressed: !profileSetupVM.completedStep.value
                                  ? null
                                  : () => ProfileSetupHelper.onNextPressed(
                                        profileSetupVM,
                                      ),
                              child: const Text(
                                  ProfileSetupStrings.kProgressBtnTxt),
                            );
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
