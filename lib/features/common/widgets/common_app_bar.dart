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
  final Widget? leadingWidget;
  final bool disableBackBtn;
  final Color? backgroundColor;

  const CommonAppBar({
    super.key,
    this.title,
    this.centerTitle,
    this.isBrandName,
    this.trailingWidget = const SizedBox.shrink(),
    this.customTitle,
    this.leadingWidget,
    this.disableBackBtn = false,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      leadingWidth: 40,
      leading: leadingWidget ??
          RPadding(
            padding: const EdgeInsets.only(left: 10),
            child: (!disableBackBtn)
                ? IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      CupertinoIcons.back,
                      color: (Get.find<ThemeManager>().isDarkMode(context) ==
                              Brightness.light)
                          ? Colors.grey.shade900
                          : Colors.white,
                      size: 30,
                    ),
                  )
                : const SizedBox.shrink(),
          ),
      title: customTitle ??
          Text(
            title ?? '',
            style: (isBrandName != null && isBrandName!)
                ? Theme.of(context).textTheme.titleLarge
                : Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
          ),
      centerTitle: centerTitle,
      actions: [trailingWidget],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
