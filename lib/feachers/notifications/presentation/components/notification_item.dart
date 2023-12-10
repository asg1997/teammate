import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/core/theme/app_decorations.dart';
import 'package:teammate/core/theme/app_fonts.dart';

class NotificationItem extends ConsumerWidget {
  const NotificationItem({
    required this.title,
    required this.value,
    required this.onChanged,
    super.key,
  });
  final String title;
  final bool value;
  // ignore: avoid_positional_boolean_parameters
  final void Function(bool value) onChanged;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15)
          .copyWith(right: 10),
      decoration: BoxDecoration(
        borderRadius: AppDecorations.defaultBorderRadius,
        color: const Color.fromARGB(255, 56, 56, 56),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: AppFonts.regular15.copyWith(color: Colors.white),
            ),
          ),
          SizedBox(
            height: 10,
            child: CupertinoSwitch(
              value: value,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
