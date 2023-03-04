import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:teammate/core/consts/app_fonts.dart';

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget({super.key, required this.text});

  final String text;

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime? choosenTime;

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
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
          Text(
            widget.text,
            style: AppFonts.medium14,
          ),
          const SizedBox(height: 10),
          Container(
            height: 55,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
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
                  },
                ),
              ),
              child: choosenTime != null
                  ? Text(
                      DateFormat('dd MMMM, hh:mm, EEEE', 'ru')
                          .format(choosenTime!),
                      style: AppFonts.regular15.copyWith(color: Colors.black),
                    )
                  : Container(),
            ),
          ),
        ],
      ),
    );
  }
}
