import 'package:flutter/material.dart';
import 'package:snap_share/features/common/widgets/image_picker_widget.dart';

void addStoryDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return const ImagePickerWidget();
    },
  );
}
