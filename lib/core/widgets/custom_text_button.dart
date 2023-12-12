import 'package:flutter/material.dart';
import 'package:teammate/core/theme/app_fonts.dart';
import 'package:teammate/core/widgets/loading_widget.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    required this.onTap,
    required this.title,
    this.isLoading = false,
    super.key,
  });
  final String title;
  final VoidCallback onTap;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Padding(
            padding: EdgeInsets.all(16),
            child: LoadingWidget(
              color: Colors.white,
              side: 14,
            ),
          )
        : TextButton(
            onPressed: onTap,
            child: Text(
              title,
              style: AppFonts.button,
            ),
          );
  }
}
