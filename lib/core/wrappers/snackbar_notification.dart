import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snap_share/core/resources/colors/app_colors.dart';

SnackbarController showSnackBarNotification({
  required String title,
  required String message,
  required bool isError,
}) {
  return Get.snackbar(
    "",
    "",
    titleText: Text(
      title,
      style: Theme.of(Get.context!).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
    ),
    messageText: Text(
      message,
      style: Theme.of(Get.context!).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 14,
          ),
    ),
    colorText: Colors.white,
    backgroundColor: AppColors.kPrimaryColor.withOpacity(0.9),
    icon: Icon(
      isError ? Icons.info_outline_rounded : null,
      color: Colors.white,
    ),
  );
}
