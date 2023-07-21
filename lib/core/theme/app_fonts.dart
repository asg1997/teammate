import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:teammate/core/theme/app_colors.dart';

abstract class AppFonts {
  AppFonts._();

// BOLD:

  static final bold20 = GoogleFonts.openSans(
    fontSize: 20,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

// SEMIBOLD:

  static final semiBold20 = GoogleFonts.openSans(
    fontSize: 20,
    color: Colors.white,
    fontWeight: FontWeight.w700,
  );

  // LIGHT

  static final light13 = GoogleFonts.openSans(
    fontSize: 13,
    color: Colors.black,
    fontWeight: FontWeight.w400,
  );

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
    fontWeight: FontWeight.w800,
  );
  static final titleMedium = GoogleFonts.roboto(
    fontSize: 20,
    color: Colors.white,
    fontWeight: FontWeight.w800,
  );

  static final medium16 = GoogleFonts.roboto(
    fontSize: 16,
    color: AppColors.secondary,
    fontWeight: FontWeight.w800,
  );

  static final regular15 = GoogleFonts.roboto(
    fontSize: 15,
    color: AppColors.main,
  );

  static final regular14 = GoogleFonts.roboto(
    fontSize: 14,
    color: Colors.black,
  );

  static final regular10 = GoogleFonts.roboto(
    fontSize: 10,
    color: AppColors.main,
  );

  static final medium14 = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static final errorText = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.main,
  );

  static final tfMedium16 = GoogleFonts.roboto(
    fontSize: 16,
    color: Colors.black,
    fontWeight: FontWeight.w600,
  );

  static final titleSmall = GoogleFonts.roboto(
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.w800,
  );

  static final button = GoogleFonts.roboto(
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.w600,
  );
}
