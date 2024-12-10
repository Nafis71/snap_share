import 'package:flutter/material.dart';
import 'package:snap_share/core/utilities/exports/resource_export.dart';
import 'package:snap_share/features/common/widgets/image_widget.dart';

class ProfileWithBorder extends StatelessWidget {
  const ProfileWithBorder({
    super.key,
    required this.profileUrl,
    this.width = 48,
    this.height = 48,
  });

  final String profileUrl;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.kWhiteColor,
        border: Border.all(
          width: 2,
          color: AppColors.kPrimaryColor,
        ),
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(3),
      child: SizedBox(
        height: height,
        width: width,
        child: ImageWidget(
          radius: 100,
          imageProvider: NetworkImage(profileUrl),
        ),
      ),
    );
  }
}
