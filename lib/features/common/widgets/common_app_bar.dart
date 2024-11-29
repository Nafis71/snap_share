import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:snap_share/core/resources/managers/theme_manager.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? customTitle;
  final bool? centerTitle;
  final bool? isBrandName;
  final Widget trailingWidget;

  const CommonAppBar({
    super.key,
    this.title,
    this.centerTitle,
    this.isBrandName,
    this.trailingWidget = const SizedBox.shrink(),
    this.customTitle,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 40,
      leading: RPadding(
        padding: const EdgeInsets.only(left: 10),
        child: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            CupertinoIcons.back,
            color:
                (Get.find<ThemeManager>().getTheme(context) == Brightness.light)
                    ? Colors.grey.shade900
                    : Colors.white,
            size: 30,
          ),
        ),
      ),
      title: customTitle ??
          Text(
            title ?? '',
            style: (isBrandName != null && isBrandName!)
                ? Theme.of(context).textTheme.titleLarge
                : Theme.of(context).textTheme.titleMedium,
          ),
      centerTitle: centerTitle,
      actions: [trailingWidget],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(45);
}
