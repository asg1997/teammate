import 'package:flutter/material.dart';
import 'package:teammate/core/theme/app_colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
    this.side = 30,
    this.color,
    this.strokeWidth = 4,
  });
  final double side;
  final Color? color;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.square(
        dimension: side,
        child: CircularProgressIndicator(
          strokeWidth: strokeWidth,
          color: color ?? AppColors.main,
        ),
      ),
    );
  }
}
