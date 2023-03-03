import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:teammate/core/consts/app_fonts.dart';

class GenderDropdownWidget extends StatefulWidget {
  const GenderDropdownWidget({Key? key}) : super(key: key);

  @override
  State<GenderDropdownWidget> createState() => _GenderDropdownWidgetState();
}

class _GenderDropdownWidgetState extends State<GenderDropdownWidget> {
  final List<String> items = [
    'Женский',
    'Мужской',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Пол*', style: AppFonts.tfMedium14),
        const SizedBox(height: 10),
        DropdownButton2(
          items: items
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: AppFonts.regular15.copyWith(
                        color: Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ))
              .toList(),
          value: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value as String;
            });
          },
          icon: Container(),
          buttonHeight: 55,
          buttonWidth: double.infinity,
          buttonPadding: const EdgeInsets.only(left: 14, right: 14),
          buttonDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: Colors.black26,
            ),
            color: Colors.white,
          ),
          buttonElevation: 2,
          itemHeight: 40,
          itemPadding: const EdgeInsets.only(left: 14, right: 14),
          dropdownMaxHeight: 200,
          dropdownWidth: double.infinity,
          dropdownPadding: null,
          dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.white,
          ),
          dropdownElevation: 8,
          scrollbarRadius: const Radius.circular(40),
          scrollbarThickness: 6,
          scrollbarAlwaysShow: true,
          offset: const Offset(-20, 0),
        ),
      ],
    );
  }
}
