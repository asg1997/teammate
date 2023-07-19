import 'package:flutter/material.dart';
import 'package:teammate/core/app_decorations.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppDecorations.mainColor,
      ),
    );
  }
}
