import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:teammate/core/consts/app_colors.dart';
import 'package:teammate/core/consts/app_decorations_prop.dart';
import 'package:teammate/core/consts/app_fonts.dart';

class PhoneTextField extends HookWidget {
  const PhoneTextField({
    required this.onChanged,
    super.key,
  });
  final ValueChanged<String> onChanged;

  static final _border = OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.white),
    borderRadius: AppDecorations.defaultBorderRadius,
  );

  @override
  Widget build(BuildContext context) {
    final phoneNumberController = useTextEditingController();
    final maskFormatter = MaskTextInputFormatter(
      mask: '(###) ###-##-##',
      filter: {'#': RegExp('[0-9]')},
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Введите номер телефона'),
        const SizedBox(height: 10),
        TextField(
          controller: phoneNumberController,
          cursorColor: AppColors.main,
          keyboardType: TextInputType.phone,
          inputFormatters: [maskFormatter],
          onChanged: (value) {
            onChanged(phoneNumberController.text);
          },
          style: AppFonts.regular15.copyWith(color: Colors.black),
          decoration: InputDecoration(
            hintText: '(___) ___-__-__',
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                '+7 ',
                style: AppFonts.medium14,
              ),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            prefixStyle: AppFonts.regular14,
            filled: true,
            prefixIconConstraints: const BoxConstraints(),
            fillColor: Colors.white,
            border: _border,
            focusedBorder: _border,
            errorBorder: _border,
            enabledBorder: _border,
          ),
        ),
      ],
    );
  }
}
