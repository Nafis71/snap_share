import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:snap_share/features/authentication/profile_setup/utilities/profile_setup_strings.dart';
import 'package:snap_share/features/authentication/profile_setup/view_model/profile_setup_vm.dart';

class ProfilePictureSelection extends StatelessWidget {
  final ProfileSetupVM profileSetupVM;

  const ProfilePictureSelection({super.key, required this.profileSetupVM});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ProfileSetupStrings.kImageSelectionHeader,
          style: Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(fontWeight: FontWeight.normal),
        ),
        const Gap(50),
        Center(
          child: Obx(() {
            return CircleAvatar(
              radius: 120,
              backgroundColor: (profileSetupVM.pickedImage == null)
                  ? Colors.grey.shade200
                  : Colors.transparent,
              backgroundImage: (profileSetupVM.pickedImage != null)
                  ? FileImage(profileSetupVM.pickedImage!)
                  : null,
            );
          }),
        ),
        const Gap(30),
        Center(
          child: ElevatedButton(
            onPressed: () {
              profileSetupVM.pickImage();
            },
            child: const Text(ProfileSetupStrings.kImageSelectionBtnTxt),
          ),
        ),
      ],
    );
  }
}
