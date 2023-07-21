import 'package:flutter/material.dart';
import 'package:teammate/core/theme/app_colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({this.color = AppColors.main, super.key});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          color: color,
        ),
      ),
    );
  }
}
