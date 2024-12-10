import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? customTitle;
  final bool? centerTitle;
  final bool? isBrandName;
  final List<Widget>? trailingWidget;
  final Widget? leadingWidget;
  final bool disableBackBtn;
  final Color? backgroundColor;
  final SystemUiOverlayStyle? statusBarColor;
  final double leadingWidth;

  const CommonAppBar({
    super.key,
    this.title,
    this.centerTitle,
    this.isBrandName,
    this.trailingWidget,
    this.customTitle,
    this.leadingWidget,
    this.disableBackBtn = false,
    this.backgroundColor,
    this.statusBarColor,
    this.leadingWidth = 40,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      leadingWidth: leadingWidth,
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
                      size: 30,
                      color: Theme.of(context).iconTheme.color,
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
      actions: trailingWidget,
      systemOverlayStyle: statusBarColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
