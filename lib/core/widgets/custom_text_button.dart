import 'package:flutter/material.dart';
import 'package:teammate/core/theme/app_fonts.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    required this.onTap,
    required this.title,
    super.key,
  });
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        title,
        style: AppFonts.button,
      ),
    );
  }
}
