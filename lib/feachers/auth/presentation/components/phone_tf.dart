import 'package:flutter/material.dart';
import 'package:teammate/core/consts/app_colors.dart';
import 'package:teammate/core/consts/app_decorations_prop.dart';
import 'package:teammate/core/consts/app_fonts.dart';

class PhoneTextFieldWidget extends StatelessWidget {
  const PhoneTextFieldWidget({super.key, this.onChanged});

  static final _border = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
      borderRadius: AppDecProp.defaultBorderRadius);

  final Function(String value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Номер телефона',
          style: AppFonts.tfMedium14,
        ),
        const SizedBox(height: 10),
        SizedBox(
            height: 55,
            width: double.infinity,
            child: TextField(
              cursorColor: AppColors.main,
              keyboardType: TextInputType.phone,
              autofocus: false,
              onChanged: onChanged,
              style: AppFonts.regular15.copyWith(color: Colors.black),
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(top: 20, bottom: 20),
                  filled: true,
                  prefixIconConstraints: const BoxConstraints(),
                  prefixIcon: Padding(
                      padding:
                          const EdgeInsets.only(left: 16, top: 18, bottom: 18),
                      child: Text('+7  ', style: AppFonts.tfMedium16)),
                  fillColor: Colors.white,
                  border: _border,
                  focusedBorder: _border,
                  errorBorder: _border,
                  enabledBorder: _border),
            )),
      ],
    );
  }
}
