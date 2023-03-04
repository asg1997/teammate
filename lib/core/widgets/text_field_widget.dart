import 'package:flutter/material.dart';
import 'package:teammate/core/consts/app_colors.dart';
import 'package:teammate/core/consts/app_decorations_prop.dart';
import 'package:teammate/core/consts/app_fonts.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    super.key,
    this.initialText,
    this.title,
    this.onChanged,
    this.textInputType = TextInputType.text,
    this.isPassword = false,
    this.hint,
  });

  final String? title;
  final String? hint;

  final bool isPassword;
  final TextInputType textInputType;
  final void Function(String)? onChanged;
  final String? initialText;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool isHidden = true;
  TextEditingController? _textController;

  void _initController() {
    _textController ??= TextEditingController();
    _listenChanges();
  }

  void _listenChanges() {
    if (widget.onChanged == null) return;
    _textController!.addListener(() {
      widget.onChanged!(_textController!.text);
    });
  }

  void _setInitialValue() {
    if (widget.initialText == null) return;
    _textController!.value = TextEditingValue(
      // начальное значение текста
      text: widget.initialText!,
      // перемещаем курсов в конец строки
      selection: TextSelection.fromPosition(
        TextPosition(
          offset: widget.initialText!.length,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _initController();
    _setInitialValue();
    TextSelection.collapsed(offset: _textController!.text.length);
  }

  @override
  void didUpdateWidget(covariant TextFieldWidget oldWidget) {
    if (_textController!.text.isEmpty &&
        widget.initialText != null &&
        widget.initialText!.isNotEmpty) {
      _setInitialValue();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null) ...[
          Text(
            widget.title!,
            style: AppFonts.medium14,
          ),
          const SizedBox(height: 10),
        ],
        SizedBox(
          height: AppDecorations.textFieldHeight,
          child: TextField(
            style: const TextStyle(),
            cursorColor: AppColors.main,
            controller: _textController,
            obscureText: widget.isPassword && isHidden,
            keyboardType: widget.textInputType,
            decoration: InputDecoration(
              hintStyle: const TextStyle(color: Colors.grey),
              hintText: widget.hint,
              border: OutlineInputBorder(
                borderRadius: AppDecorations.defaultBorderRadius,
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.only(left: 16),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
