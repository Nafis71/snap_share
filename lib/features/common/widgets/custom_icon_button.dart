import 'package:flutter/material.dart';
import 'package:snap_share/core/utilities/exports/wrapper_export.dart';

class CustomSvgIconButton extends StatelessWidget {
  const CustomSvgIconButton({
    super.key,
    required this.onPressed,
    required this.iconPath,
    this.iconBgColor,
    this.iconColor,
    this.iconSize,
  });

  final VoidCallback onPressed;
  final String iconPath;
  final Color? iconBgColor;
  final Color? iconColor;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        backgroundColor: iconBgColor,
        iconSize: iconSize,
      ),
      onPressed: onPressed,
      icon: SvgLoader(asset: iconPath),
    );
  }
}
