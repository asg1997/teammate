import 'package:flutter/material.dart';
import 'package:teammate/core/consts/app_fonts.dart';

class MainAppBarWidget extends StatelessWidget {
  const MainAppBarWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackButton(
          color: Colors.white,
        ),
        // ТЕКСТ АВТОРИЗАЦИЯ
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              title,
              style: AppFonts.bold20,
            ),
          ),
        ),
      ],
    );
  }
}
