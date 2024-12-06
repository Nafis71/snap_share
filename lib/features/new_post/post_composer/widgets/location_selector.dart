import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/colors/app_colors.dart';
import '../utilities/post_composer_strings.dart';

class LocationSelector extends StatelessWidget {
  const LocationSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return RPadding(
      padding: const EdgeInsets.only(top: 8, bottom: 8).r,
      child: GestureDetector(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              PostComposerStrings.kAddLocationText,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
            const Icon(
              CupertinoIcons.location_solid,
              color: AppColors.kPrimaryColor,
            )
          ],
        ),
      ),
    );
  }
}
