import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

abstract class AppFonts {
  AppFonts._();
  static final bodyLarge = GoogleFonts.roboto(
    fontSize: 18,
    color: AppColors.secondary,
    fontWeight: FontWeight.w600,
  );
  static final bodyMedium = GoogleFonts.roboto(
    fontSize: 16,
    color: AppColors.secondary,
    fontWeight: FontWeight.w400,
  );
  static final bodySmall = GoogleFonts.roboto(
    fontSize: 16,
    color: Colors.black,
    fontWeight: FontWeight.w300,
  );

  static final titleLarge = GoogleFonts.roboto(
    fontSize: 24,
    color: Colors.white,
    fontWeight: FontWeight.w600,
  );

  static final titleSmall = GoogleFonts.roboto(
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.w600,
  );

  static final button = GoogleFonts.roboto(
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.w600,
  );
}
