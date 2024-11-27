import 'package:flutter/material.dart';
import 'package:snap_share/export_file.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, this.appName});

  final String? appName;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Image.asset(ImagesPaths.appLogoPng,
            width: SplashSizes.appLogoMediumSize),
        if (appName != null)
          const SizedBox(height: SpacingConstants.smallSpacing),
        if (appName != null)
          Text(
            appName!,
            style: textTheme.titleLarge,
          ),
      ],
    );
  }
}
