import 'package:flutter/material.dart';
import 'package:snap_share/core/resources/colors/app_colors.dart';
import 'package:snap_share/features/common/widgets/image_widget.dart';
import 'package:snap_share/features/home/widgets/profile_with_border.dart';

class StoryCard extends StatelessWidget {
  const StoryCard({
    super.key,
    this.widget,
    required this.profileUrl,
    required this.storyUrl,
    required this.userName,
    required this.onTap,
  });

  final Widget? widget;
  final String profileUrl;
  final String storyUrl;
  final String userName;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: onTap,
      child: Card(
        color: AppColors.kWhisperWhite,
        child: SizedBox(
          height: 150,
          width: 120,
          child: Stack(
            children: [
              ImageWidget(
                height: 120,
                width: 120,
                radius: 8,
                imageProvider: NetworkImage(storyUrl),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  userName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.titleMedium?.copyWith(fontSize: 17),
                ),
              ),
              if (widget != null) widget!,
              Positioned(
                left: 4,
                top: 4,
                child: ProfileWithBorder(
                  height: 30,
                  width: 30,
                  profileUrl: profileUrl,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
