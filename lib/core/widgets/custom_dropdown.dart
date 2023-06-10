import 'package:flutter/material.dart';

class CustomDropdown<T> extends StatelessWidget {
  const CustomDropdown({
    required this.items,
    required this.value,
    required this.onChanged,
    this.hint,
    super.key,
  });
  final List<DropdownMenuItem<T>> items;
  final Widget? hint;
  final T value;
  final void Function(T? value) onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      alignment: Alignment.center,
      color: Colors.white,
      child: DropdownButton<T>(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        underline: Container(),
        isExpanded: true,
        hint: hint,
        iconEnabledColor: Colors.black,
        focusColor: Colors.white,
        dropdownColor: Colors.white,
        items: items,
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
