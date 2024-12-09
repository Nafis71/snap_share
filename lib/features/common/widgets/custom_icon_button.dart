import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.iconBgColor,
    this.iconColor,
    this.iconSize,
  });

  final VoidCallback onPressed;
  final IconData icon;
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
      icon: Icon(
        icon,
        color: iconColor,
      ),
    );
  }
}
