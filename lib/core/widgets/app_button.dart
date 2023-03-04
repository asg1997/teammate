import 'package:flutter/material.dart';
import 'package:teammate/core/consts/app_colors.dart';
import 'package:teammate/core/consts/app_fonts.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.title,
    required this.onTap,
    this.isLoading = false,
    super.key,
  });

  final String title;
  final VoidCallback onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 220,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.main,
          textStyle: const TextStyle(fontSize: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: isLoading
            ? const Center(
                child: SizedBox.square(
                  dimension: 12,
                  child: CircularProgressIndicator(color: Colors.white),
                ),
              )
            : Text(
                title,
                style: AppFonts.button,
              ),
      ),
    );
  }
}
