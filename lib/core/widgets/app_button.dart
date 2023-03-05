import 'package:flutter/material.dart';
import 'package:teammate/core/consts/app_colors.dart';
import 'package:teammate/core/consts/app_fonts.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.title,
    required this.onTap,
    this.isLoading = false,
    this.color,
    this.height = 50,
    this.width = 220,
    super.key,
  });

  final String title;
  final VoidCallback onTap;
  final bool isLoading;
  final double width;
  final double height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? AppColors.main,
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
