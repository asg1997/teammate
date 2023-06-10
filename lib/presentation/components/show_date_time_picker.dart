import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showDateTimePicker(
  BuildContext context, {
  required DateTime initial,
  required Function(DateTime value) onChanged,
}) {
  showCupertinoModalPopup(
      context: context,
      builder: (_) => _DatePickerPopUp(
            initialValue: initial,
            onDatePicked: onChanged,
          ));
}

class _DatePickerPopUp extends StatelessWidget {
  const _DatePickerPopUp({
    required this.onDatePicked,
    this.initialValue,
  });

  final void Function(DateTime value) onDatePicked;
  final DateTime? initialValue;

  @override
  Widget build(BuildContext context) {
    DateTime selectedDate = initialValue ?? DateTime.now();
    return Material(
      child: Container(
        color: Colors.white,
        height: 300,
        padding: const EdgeInsets.only(top: 10.0, right: 16),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  onDatePicked(selectedDate);
                  Navigator.pop(context);
                },
                child: const Text(
                  'Готово',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Expanded(
                child: CupertinoDatePicker(
                  use24hFormat: true,
                  minimumDate: DateTime.now(),
                  onDateTimeChanged: (value) => selectedDate = value,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
