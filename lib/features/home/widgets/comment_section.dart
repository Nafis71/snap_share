import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:snap_share/core/utilities/exports/resource_export.dart';
import 'package:snap_share/core/utilities/exports/widget_export.dart';
import 'package:snap_share/core/utilities/exports/wrapper_export.dart';
import 'package:snap_share/core/utilities/validators/form_validator.dart';
import 'package:snap_share/features/common/widgets/custom_icon_button.dart';
import 'package:snap_share/features/common/widgets/image_widget.dart';
import 'package:snap_share/features/home/utilities/constants/home_strings.dart';
import 'package:snap_share/features/home/widgets/profile_with_border.dart';

class CommentSection extends StatefulWidget {
  const CommentSection({super.key});

  @override
  State<CommentSection> createState() => _CommentSectionState();
}

class _CommentSectionState extends State<CommentSection> {
  final TextEditingController _commentTEController = TextEditingController();
  final Map<int, TextEditingController> _replyControllers = {};
  final Map<int, bool> _showReplyField = {};
  String commentText = "";

  void _toggleReplyField(int index) {
    setState(() {
      _showReplyField[index] = !(_showReplyField[index] ?? false);
    });
  }

  void _submitComment() {
    debugPrint("Comment submitted: $commentText");
    _commentTEController.clear();
  }

  void _submitReply(int index) {
    debugPrint(
        "Reply submitted for index $index: ${_replyControllers[index]?.text}");
    _replyControllers[index]?.clear();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 16.0,
      ),
      child: Column(
        children: [
          const SvgLoader(asset: IconAssets.kRectangleIcon),
          const Gap(8),
          Text(
            HomeStrings.kCommentsTxt,
            style: textTheme.titleMedium,
          ),
          const Divider(thickness: 3),
          Expanded(
            child: _buildCommentList(
              textTheme: textTheme,
            ),
          ),
          const Divider(thickness: 2),
          _buildCommentTextFieldSection(),
        ],
      ),
    );
  }

  Widget _buildCommentList({
    required TextTheme textTheme,
  }) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            children: [
              _buildUserCommentsInfo(
                context: context,
                index: index,
                textTheme: textTheme,
              ),
              if (_showReplyField[index] ?? false)
                _buildReplyField(
                  index: index,
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildUserCommentsInfo({
    required BuildContext context,
    required int index,
    required TextTheme textTheme,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ImageWidget(
          height: 48,
          width: 48,
          radius: 100,
          imageProvider:
              NetworkImage("https://picsum.photos/200?random=$index"),
        ),
        const Gap(8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Snap Share",
                    style: textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(8),
                  Text(
                    "5 min ago",
                    style: textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.kGreyColor),
                  ),
                  const Spacer(),
                  CustomSvgIconButton(
                    iconBgColor: Colors.transparent,
                    onPressed: () {},
                    iconPath: IconAssets.kLoveRectOutlineIcon,
                  ),
                ],
              ),
              const Gap(4),
              Text(
                "This is a Snap Share app.",
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Gap(4),
              _buildReplyButton(
                index: index,
                textTheme: textTheme,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildReplyButton({
    required int index,
    required TextTheme textTheme,
  }) {
    return TextButton(
      onPressed: () => _toggleReplyField(index),
      child: Text(
        HomeStrings.kReplayTxt,
        style: textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildReplyField({
    required int index,
  }) {
    _replyControllers[index] ??= TextEditingController();

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        children: [
          const ProfileWithBorder(
            height: 35,
            width: 35,
            profileUrl: "https://picsum.photos/200?random=99",
          ),
          const Gap(8),
          Expanded(
            child: CustomTextField(
              disableBorder: true,
              hintText: HomeStrings.kReplayCommentTxt,
              formValidator: (value) => FormValidator.validateComment(value),
              controller: _replyControllers[index]!,
              isDark: false,
            ),
          ),
          const Gap(8),
          TextButton(
            onPressed: () => _submitReply(index),
            child: const Text(HomeStrings.kCommentSubmitTxt),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentTextFieldSection() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const ProfileWithBorder(
            profileUrl: "https://picsum.photos/200?random=99",
            height: 35,
            width: 35,
          ),
          const Gap(8),
          Expanded(
            child: CustomTextField(
              hintText: HomeStrings.kAddCommentsTxt,
              formValidator: (value) => FormValidator.validateComment(value),
              controller: _commentTEController,
              isDark: false,
              disableBorder: true,
              onChanged: (value) => setState(
                () {
                  commentText = value;
                },
              ),
            ),
          ),
          const Gap(8),
          TextButton(
            onPressed: _submitComment,
            child: const Text(HomeStrings.kCommentSubmitTxt),
          ),
        ],
      ),
    );
  }
}
