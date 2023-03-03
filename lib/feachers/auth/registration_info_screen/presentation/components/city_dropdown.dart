import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:teammate/core/consts/app_fonts.dart';

class CityDropdownWidget extends StatelessWidget {
  const CityDropdownWidget({super.key, this.onChanged});

  final Function(String value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Город*', style: AppFonts.tfMedium14),
        const SizedBox(height: 10),
        DropdownSearch<String>(
          popupProps: PopupProps.menu(
            showSelectedItems: true,
            showSearchBox: true,
            disabledItemFn: (String s) => s.startsWith('I'),
          ),
          items: const [
            "Тула",
            "Москва",
            'Калуга',
            "Тула",
            "Москва",
            'Калуга',
          ],
          dropdownDecoratorProps: DropDownDecoratorProps(
            baseStyle: AppFonts.regular15.copyWith(color: Colors.black),
            dropdownSearchDecoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none),
            ),
          ),
          onChanged: (value) => {
            if (value != null && onChanged != null) onChanged!(value),
          },
          selectedItem: '',
        ),
      ],
    );
  }
}
