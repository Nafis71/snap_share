import 'package:flutter/material.dart';
import 'package:snap_share/core/utilities/exports/resource_export.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final String? Function(dynamic) formValidator;
  final bool isPassword;
  final Widget? suffixWidget;
  final Widget? alternateSuffixWidget;
  final Widget? prefixWidget;
  final String? prefixText;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final Function(dynamic)? onChanged, onFieldSubmitted;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.formValidator,
    this.isPassword = false,
    this.suffixWidget,
    this.prefixWidget,
    this.prefixText,
    required this.controller,
    this.alternateSuffixWidget,
    this.onChanged,
    this.focusNode,
    this.onFieldSubmitted,
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
                    ? widget.suffixWidget
                    : widget.alternateSuffixWidget,
              )
            : null,
        prefixIcon: widget.prefixWidget,
        prefixText: widget.prefixText,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.formValidator,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onFieldSubmitted,
    );
  }
}
