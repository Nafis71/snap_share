import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:snap_share/core/utilities/exports/widget_export.dart';
import 'package:snap_share/features/authentication/profile_setup/utilities/profile_setup_strings.dart';
import 'package:snap_share/features/authentication/profile_setup/view_model/profile_setup_vm.dart';

class UserDetails extends StatelessWidget {
  final ProfileSetupVM profileSetupVM;

  const UserDetails({super.key, required this.profileSetupVM});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ProfileSetupStrings.kUserDetailsHeader,
          style: Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(fontWeight: FontWeight.normal),
        ),
        const Gap(30),
        Text(
          ProfileSetupStrings.kUserNameFieldLabel,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const Gap(5),
        Form(
          key: profileSetupVM.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                hintText: ProfileSetupStrings.kUserNameFieldHint,
                formValidator: (v) => null,
                controller: profileSetupVM.usernameTEController,
                focusNode: profileSetupVM.userNameFocusNode,
                isDark: false,
                prefixIconPath: null,
                onFieldSubmitted: (_) {
                  FocusScope.of(context)
                      .requestFocus(profileSetupVM.profileNameFocusNode);
                },
                onChanged: (_) => profileSetupVM.updateButtonState(),
              ),
              const Gap(10),
              Text(
                ProfileSetupStrings.kProfileNameFieldLabel,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const Gap(5),
              CustomTextField(
                hintText: ProfileSetupStrings.kProfileNameFieldHint,
                formValidator: (v) => null,
                controller: profileSetupVM.profileNameTEController,
                focusNode: profileSetupVM.profileNameFocusNode,
                isDark: false,
                prefixIconPath: null,
                onFieldSubmitted: (_) {
                  if (profileSetupVM.usernameTEController.text.isEmpty) {
                    FocusScope.of(context)
                        .requestFocus(profileSetupVM.userNameFocusNode);
                  }
                },
                onChanged: (_) => profileSetupVM.updateButtonState(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
