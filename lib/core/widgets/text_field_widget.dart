import 'package:flutter/material.dart';
import 'package:teammate/core/theme/app_colors.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    required this.onChanged,
    required this.title,
    required this.hint,
    super.key,
  });
  final void Function(String value) onChanged;
  final String? title;
  final String hint;
  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        focusColor: AppColors.background,
        focusedBorder: const OutlineInputBorder(),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        border: const OutlineInputBorder(),
        labelText: widget.title,
        hintText: widget.hint,
        fillColor: Colors.white,
        errorStyle: const TextStyle(color: Colors.red),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
    );
  }
}
