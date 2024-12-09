import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:snap_share/core/utilities/exports/resource_export.dart';
import 'package:snap_share/features/onboarding/utilities/onboarding_helper.dart';
import 'package:snap_share/features/onboarding/utilities/onboarding_strings.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RPadding(
          padding: EdgeInsets.all(Paddings.kScreenAllPadding).w,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppStrings.kAppName,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Gap(48),
                _buildRegistrationBtn(context),
                const Gap(25),
                _buildLoginBtn(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRegistrationBtn(BuildContext context) {
    return RSizedBox(
      width: 0.8.sw,
      height: 36.h,
      child: const ElevatedButton(
        onPressed: OnBoardingHelper.gotoSignUpView,
        child: Text(OnboardingStrings.kRegistrationBtnTxt),
      ),
    );
  }

  Widget _buildLoginBtn(BuildContext context) {
    return GestureDetector(
      onTap: OnBoardingHelper.gotoSignInView,
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
    );
  }
}
