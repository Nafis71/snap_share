import 'package:flutter/material.dart';
import 'package:snap_share/features/new_post/post_composer/widgets/post_alert_dialog.dart';

class PostComposerHelper {
  static showPostAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return const PostAlertDialog();
      },
    );
  }
}
