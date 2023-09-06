import 'package:flutter/material.dart';
import 'package:teammate/core/theme/app_decorations.dart';

class CustomDropdown<T> extends StatefulWidget {
  const CustomDropdown({
    required this.items,
    required this.initialValue,
    required this.onChanged,
    this.hint,
    super.key,
  });
  final List<DropdownMenuItem<T>> items;
  final Widget? hint;
  final T initialValue;
  final void Function(T? value) onChanged;

  @override
  State<CustomDropdown<T>> createState() => _CustomDropdownState<T>();
}

class _CustomDropdownState<T> extends State<CustomDropdown<T>> {
  late T selectedValue = widget.initialValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      alignment: Alignment.center,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: DropdownButton<T>(
        underline: Container(),
        isExpanded: true,
        hint: widget.hint,
        borderRadius: AppDecorations.defaultBorderRadius,
        iconEnabledColor: Colors.black,
        focusColor: Colors.white,
        dropdownColor: Colors.white,
        items: widget.items,
        value: selectedValue,
        onChanged: (newValue) {
          if (newValue == null) return;
          widget.onChanged(newValue);
          selectedValue = newValue;
          setState(() {});
        },
      ),
    );
  }
}
