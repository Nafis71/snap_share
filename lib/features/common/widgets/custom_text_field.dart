import 'package:flutter/material.dart';
import 'package:snap_share/core/resources/managers/theme_manager.dart';
import 'package:snap_share/core/utilities/exports/resource_export.dart';

import '../../../core/utilities/exports/wrapper_export.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final String? Function(dynamic) formValidator;
  final bool isPassword;
  final IconData? suffixIcon;
  final IconData? alternateSuffixIcon;
  final String prefixIconPath;
  final String? prefixText;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final Function(dynamic)? onChanged, onFieldSubmitted;
  final ThemeManager themeManager;

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
    required this.themeManager,
    required this.prefixIconPath,
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
      obscureText: showObscureText,
      obscuringCharacter: "*",
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        prefixIconConstraints: BoxConstraints.tight(const Size(60, 24)),
        hintText: widget.hintText,
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
        prefixIcon: _prefixIcon(context),
        prefixText: widget.prefixText,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.formValidator,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onFieldSubmitted,
    );
  }

  Widget _prefixIcon(BuildContext context) {
    return SvgLoader(
      // asset: IconAssets.kPasswordIcon,
      asset: widget.prefixIconPath,
      color: (widget.themeManager.getTheme(context) == Brightness.dark)
          ? DarkThemeColors.kTxtFieldPrefixIconColor
          : null,
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
      color: (widget.themeManager.getTheme(context) == Brightness.dark)
          ? DarkThemeColors.kTxtFieldSuffixIconColor
          : null,
    );
  }
}
