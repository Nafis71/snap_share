import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snap_share/core/utilities/exports/resource_export.dart';
import 'package:snap_share/core/utilities/exports/widget_export.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(Paddings.kScreenAllPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                OnboardingStrings.kAppName,
                style: TextThemeStyles.getDefaultTextStyle(
                        fontFamily: GoogleFonts.lobster)
                    .copyWith(
                  fontSize: FontSizes.kTitleLargeTxtSize.sp,
                ),
              ),
              const SizedBox(height: SpacingConstants.kExtraMediumSpacing),
              CustomButton(
                onTap: () {},
                title: OnboardingStrings.kBtnTitle,
              ),
              const SizedBox(height: SpacingConstants.kMediumSpacing),
              _buildLoginButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return GestureDetector(
      onTap: () {},
      child: Text(
        OnboardingStrings.loginText,
        style: TextThemeStyles.getDefaultTextStyle().copyWith(
          color: AppColors.kThemeColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
