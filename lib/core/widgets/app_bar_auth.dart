import 'package:flutter/material.dart';
import 'package:teammate/core/consts/app_fonts.dart';

class MainAppBarWidget extends StatelessWidget with PreferredSizeWidget {
  const MainAppBarWidget({
    required this.title,
    this.hasBackButton = true,
    super.key,
  });

  final String title;
  final bool hasBackButton;

  @override
  Size get preferredSize => const Size(double.infinity, 70);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Stack(
        children: [
          if (hasBackButton) ...[
            const Align(
              alignment: Alignment.centerLeft,
              child: BackButton(
                color: Colors.white,
              ),
            ),
          ],

          // ТЕКСТ АВТОРИЗАЦИЯ

          Center(
            child: Text(
              title,
              style: AppFonts.bold20,
            ),
          ),
        ],
      ),
    );
  }
}
