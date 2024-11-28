import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_share/core/utilities/exports/resource_export.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.title,
    this.btnColor = AppColors.kCustomBtnBgColor,
    this.titleColor = AppColors.kPrimaryTxtColor,
    this.radius = RadiusConstants.kCustomBtnDefaultRadius,
    this.btnHeight = HeightConstants.kCustomBtnDefaultHeight,
    this.btnWidth = double.maxFinite,
  });

  final VoidCallback onTap;
  final String title;
  final Color btnColor;
  final Color titleColor;
  final double radius;
  final double btnHeight;
  final double btnWidth;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: btnHeight.h,
        width: btnWidth.w,
        decoration: BoxDecoration(
          color: btnColor,
          borderRadius: BorderRadius.circular(radius).r,
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextThemeStyles.getDefaultTextStyle().copyWith(
            color: AppColors.kPrimaryTxtColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
