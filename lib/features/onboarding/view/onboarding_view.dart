import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:snap_share/core/utilities/exports/resource_export.dart';
import 'package:snap_share/features/onboarding/utilities/onboarding_strings.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(Paddings.kScreenAllPadding),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppStrings.kAppName,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Gap(48),
                RSizedBox(
                  width: 0.8.sw,
                  height: 36.h,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(OnboardingStrings.kRegistrationBtnTxt)),
                ),
                const Gap(25),
                GestureDetector(
                  onTap: () {
                    //navigate to login
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        OnboardingStrings.kLoginBtnTxt,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context).primaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const Gap(3),
                      Icon(
                        CupertinoIcons.chevron_down,
                        color: Theme.of(context).primaryColor,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
