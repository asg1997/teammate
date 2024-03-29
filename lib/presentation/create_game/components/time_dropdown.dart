import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:teammate/core/consts/app_decorations_prop.dart';
import 'package:teammate/core/consts/app_fonts.dart';

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget({
    required this.onChanged,
    this.initialData,
    super.key,
  });
  final void Function(DateTime value) onChanged;
  final DateTime? initialData;

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  late DateTime? choosenTime = widget.initialData;

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (_) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: AppFonts.regular15,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(
          //   widget.text,
          //   style: AppFonts.medium14,
          // ),
          // const SizedBox(height: 10),
          Container(
            height: 45,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: AppDecorations.defaultBorderRadius,
              color: Colors.white,
            ),
            child: CupertinoButton(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 16),
              onPressed: () => _showDialog(
                CupertinoDatePicker(
                  initialDateTime: choosenTime,
                  use24hFormat: true,
                  onDateTimeChanged: (DateTime newTime) {
                    setState(() => choosenTime = newTime);
                    widget.onChanged(choosenTime!);
                  },
                ),
              ),
              child: choosenTime != null
                  ? Text(
                      DateFormat('dd MMMM, hh:mm, EEEE', 'ru')
                          .format(choosenTime!),
                      style: AppFonts.regular15.copyWith(color: Colors.black),
                    )
                  : Text(
                      'Выберите дату',
                      style: AppFonts.regular15.copyWith(color: Colors.grey),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
