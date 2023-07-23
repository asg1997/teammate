import 'package:flutter/material.dart';
import 'package:teammate/core/theme/app_colors.dart';

import 'package:teammate/core/theme/app_fonts.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  const AppBarWidget({
    required this.text,
    super.key,
    this.leading,
  });

  final String text;
  final Widget? leading;
  @override
  Size get preferredSize => const Size(double.infinity, 60);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 70,
      elevation: 0,
      backgroundColor: AppColors.background,
      centerTitle: true,
      title: Text(
        text,
        style: AppFonts.medium18.copyWith(color: Colors.white),
      ),
      actions: (leading != null) ? [leading!] : null,
    );
  }
}
