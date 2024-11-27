import 'package:flutter/material.dart';
import 'package:snap_share/export_file.dart';

class SplashFooter extends StatelessWidget {
  const SplashFooter({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        const CenteredCircularProgressIndicator(),
        const SizedBox(height: SpacingConstants.smallSpacing),
        Text(
          SplashStrings.appVersionTxt,
          style: textTheme.titleMedium,
        ),
      ],
    );
  }
}
