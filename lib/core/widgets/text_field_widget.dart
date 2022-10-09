import 'package:flutter/material.dart';
import 'package:teammate/core/consts/app_decorations_prop.dart';
import 'package:teammate/core/consts/app_fonts.dart';

import '../consts/app_colors.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget(
      {Key? key,
      this.initialText,
      required this.title,
      this.onChanged,
      this.textInputType = TextInputType.text,
      this.hasArrow = false,
      this.isPassword = false})
      : assert(hasArrow == false || isPassword == false,
            'Поле не может быть одновременно со стрелкой и паролем'),
        super(
          key: key,
        );

  final String title;
  final bool hasArrow;
  final bool isPassword;
  final TextInputType textInputType;
  final Function(String)? onChanged;
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
        ));
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
        Text(
          widget.title,
          style: AppFonts.titleSmall,
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 60,
          width: double.infinity,
          child: TextField(
            cursorColor: AppColors.main,
            controller: _textController,
            obscureText: widget.isPassword && isHidden,
            textAlign: TextAlign.start,
            keyboardType: widget.textInputType,
            decoration: InputDecoration(
              hintText: widget.title,
              border: OutlineInputBorder(
                borderRadius: AppDecProp.defaultBorderRadius,
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              filled: true,
              contentPadding:
                  const EdgeInsets.only(left: 30, top: 20, bottom: 20),
              fillColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
