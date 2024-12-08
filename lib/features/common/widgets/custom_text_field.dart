import 'package:flutter/material.dart';
import 'package:snap_share/core/utilities/exports/resource_export.dart';

import '../../../core/utilities/exports/wrapper_export.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final String? Function(dynamic) formValidator;
  final bool isPassword;
  final IconData? suffixIcon;
  final IconData? alternateSuffixIcon;
  final String? prefixIconPath;
  final String? prefixText;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final Function(dynamic)? onChanged, onFieldSubmitted;
  final bool isDark;
  final bool? disableBorder;
  final int? maxLines;
  final String? errorText;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.formValidator,
    this.isPassword = false,
    this.suffixIcon,
    this.prefixText,
    required this.controller,
    this.alternateSuffixIcon,
    this.onChanged,
    this.focusNode,
    this.onFieldSubmitted,
    required this.isDark,
    required this.prefixIconPath,
    this.disableBorder,
    this.maxLines, this.errorText,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool showObscureText = false;

  @override
  void initState() {
    if (widget.isPassword) {
      showObscureText = true;
    }
    super.initState();
  }

  void toggleObscureText() {
    setState(() {
      showObscureText = !showObscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      cursorColor: AppColors.kPrimaryColor,
      maxLines: widget.maxLines ?? 1,
      obscureText: showObscureText,
      obscuringCharacter: "*",
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        prefixIconConstraints: BoxConstraints.tight(const Size(60, 24)),
        enabledBorder: widget.disableBorder != null && widget.disableBorder!
            ? InputBorder.none
            : null,
        focusedBorder: widget.disableBorder != null && widget.disableBorder!
            ? InputBorder.none
            : null,
        hintText: widget.hintText,
        errorText: widget.errorText,
        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: () {
                  if (widget.isPassword) toggleObscureText();
                },
                child: showObscureText
                    ? _suffixIcon(context)
                    : _alternateSuffixIcon(),
              )
            : null,
        prefixIcon:
            (widget.prefixIconPath == null) ? null : _prefixIcon(context),
        prefixText: widget.prefixText,
      ),
      autovalidateMode: AutovalidateMode.onUnfocus,
      validator: widget.formValidator,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onFieldSubmitted,
    );
  }

  Widget _prefixIcon(BuildContext context) {
    return SvgLoader(
      // asset: IconAssets.kPasswordIcon,
      asset: widget.prefixIconPath ?? "",
      color: (widget.isDark) ? DarkThemeColors.kTxtFieldPrefixIconColor : null,
    );
  }

  Widget _alternateSuffixIcon() {
    return Icon(
      widget.alternateSuffixIcon,
      size: 25,
      color: AppColors.kPrimaryColor,
    );
  }

  Widget _suffixIcon(BuildContext context) {
    return Icon(
      widget.suffixIcon,
      size: 25,
      color: (widget.isDark) ? DarkThemeColors.kTxtFieldSuffixIconColor : null,
    );
  }
}
