import 'package:flutter/material.dart';
import 'package:snap_share/features/home/widgets/comment_section.dart';

void showCommentsBottomSheet({
  required BuildContext context,
}) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(16),
      ),
    ),
    builder: (context) {
      return const CommentSection();
    },
  );
}
