import 'package:flutter/material.dart';

import 'package:teammate/core/theme/app_colors.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    required this.label,
    required this.hint,
    required this.initialValue,
    required this.onChanged,
    super.key,
  });
  final String label;
  final String hint;
  final String initialValue;
  final void Function(String value) onChanged;
  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late final controller = TextEditingController(text: widget.initialValue);

  @override
  void initState() {
    controller.addListener(_listener);
    super.initState();
  }

  void _listener() => widget.onChanged(controller.text);

  @override
  void dispose() {
    controller
      ..removeListener(_listener)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        focusColor: AppColors.background,
        focusedBorder: const OutlineInputBorder(),
        errorBorder:
            const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
        border: const OutlineInputBorder(),
        labelText: widget.label,
        hintText: widget.hint,
        fillColor: Colors.white,
        errorStyle: const TextStyle(color: Colors.red),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
    );
  }
}
