import 'package:flutter/material.dart';
import 'package:teammate/core/theme/app_colors.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    required this.title,
    this.onTap,
    this.hint,
    this.onChanged,
    this.controller,
    this.readOnly = false,
    this.maxLines = 1,
    super.key,
  });
  final void Function(String value)? onChanged;
  final String title;
  final String? hint;
  final int maxLines;
  final TextEditingController? controller;
  final VoidCallback? onTap;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      onChanged: onChanged,
      onTap: onTap,
      controller: controller,
      readOnly: readOnly,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        focusColor: AppColors.background,
        disabledBorder: const OutlineInputBorder(),
        enabledBorder: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        border: InputBorder.none,
        labelText: title,
        hintText: hint,
        fillColor: Colors.white,
        errorStyle: const TextStyle(color: Colors.red),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
    );
  }
}
