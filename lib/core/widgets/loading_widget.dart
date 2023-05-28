import 'package:flutter/material.dart';
import 'package:teammate/core/consts/app_colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, this.side = 20});
  final double side;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.square(
        dimension: side,
        child: const CircularProgressIndicator(color: AppColors.main),
      ),
    );
  }
}
