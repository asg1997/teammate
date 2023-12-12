import 'package:flutter/material.dart';
import 'package:teammate/core/extensions/context.dart';
import 'package:teammate/core/theme/app_colors.dart';
import 'package:teammate/core/theme/app_fonts.dart';
import 'package:teammate/core/widgets/custom_text_button.dart';
import 'package:teammate/core/widgets/main_button.dart';

void showCustomDialog(
  BuildContext context, {
  required String title,
  required VoidCallback onOkTapped,
  String? description,
  String? okButtonText,
}) =>
    showDialog<void>(
      context: context,
      builder: (_) => CustomDialog(
        title: title,
        onOkTapped: onOkTapped,
        okButtonText: okButtonText,
        description: description,
      ),
    );

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    required this.title,
    required this.description,
    required this.onOkTapped,
    required this.okButtonText,
    super.key,
  });
  final String title;
  final String? description;
  final String? okButtonText;

  final VoidCallback onOkTapped;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.secondaryBackground,
        ),
        width: context.width * 0.9,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: AppFonts.medium18.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 8),
            if (description != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  description!,
                  textAlign: TextAlign.center,
                  style: AppFonts.regular15.copyWith(color: Colors.white),
                ),
              ),
            const SizedBox(height: 24),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: CustomTextButton(
                    onTap: () => Navigator.of(context).pop(),
                    title: 'Отмена',
                  ),
                ),
                Expanded(
                  child: MainButton(
                    title: okButtonText ?? 'Хорошо',
                    onTap: () {
                      onOkTapped();
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
