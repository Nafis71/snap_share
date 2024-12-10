import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:snap_share/core/utilities/exports/resource_export.dart';
import 'package:snap_share/features/common/widgets/common_app_bar.dart';
import 'package:snap_share/features/common/widgets/custom_icon_button.dart';
import 'package:snap_share/features/common/widgets/image_widget.dart';
import 'package:snap_share/features/home/utilities/constants/home_strings.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
    required this.profileUrl,
  });

  final String profileUrl;

  @override
  Widget build(BuildContext context) {
    return CommonAppBar(
      disableBackBtn: true,
      centerTitle: true,
      leadingWidth: 72,
      leadingWidget: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: ImageWidget(
          radius: 100,
          imageProvider: NetworkImage(profileUrl),
        ),
      ),
      customTitle: const Text(HomeStrings.kAppBarTitle),
      trailingWidget: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Row(
            children: [
              CustomSvgIconButton(
                onPressed: () {},
                iconPath: IconAssets.kNotificationIcon,
              ),
              const Gap(8),
              CustomSvgIconButton(
                onPressed: () {},
                iconPath: IconAssets.kMessageIcon,
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
