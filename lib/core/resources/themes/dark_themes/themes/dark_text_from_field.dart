import 'package:flutter/material.dart';

import '../../base_styles/text_form_field_style.dart';

class DarkTextFormField {
  static InputDecorationTheme getTheme() {
    return TextFormFieldStyle.getDefaultStyle().copyWith(
      prefixStyle: const TextStyle(
        color: Colors.white,
      ),
    );
  }
}
