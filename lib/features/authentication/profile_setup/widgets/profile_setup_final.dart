import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:snap_share/core/resources/assets/lottie/lottie_assets.dart';
import 'package:snap_share/core/utilities/exports/wrapper_export.dart';

import '../utilities/profile_setup_strings.dart';

class ProfileSetupFinal extends StatelessWidget {
  const ProfileSetupFinal({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ProfileSetupStrings.kProfileSetupFinalHeader,
          style: Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(fontWeight: FontWeight.normal),
        ),
        const Gap(80),
        const Center(
          child: AnimationLoader(
            asset: LottieAssets.kProfileSetupAnimation,
          ),
        )
      ],
    );
  }
}
