import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/colors.dart';

class MyTextTheme {
  MyTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: GoogleFonts.breeSerif().copyWith(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: MyColors.textPrimary,
    ),
    headlineMedium: GoogleFonts.breeSerif().copyWith(
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      color: MyColors.textPrimary,
    ),
    headlineSmall: GoogleFonts.breeSerif().copyWith(
      fontSize: 20.0,
      fontWeight: FontWeight.w500,
      color: MyColors.textPrimary,
    ),
    titleLarge: GoogleFonts.breeSerif().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: MyColors.textPrimary,
    ),
    titleMedium: GoogleFonts.breeSerif().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: MyColors.textPrimary,
    ),
    titleSmall: GoogleFonts.breeSerif().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: MyColors.textPrimary,
    ),
    bodyLarge: GoogleFonts.breeSerif().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: MyColors.textPrimary,
    ),
    bodyMedium: GoogleFonts.breeSerif().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: MyColors.textPrimary,
    ),
    bodySmall: GoogleFonts.breeSerif().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: MyColors.textPrimary.withValues(alpha: 0.5),
    ),
    labelLarge: GoogleFonts.breeSerif().copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: MyColors.textPrimary,
    ),
    labelMedium: GoogleFonts.breeSerif().copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: MyColors.textPrimary.withValues(alpha: 0.5),
    ),
    labelSmall: GoogleFonts.breeSerif().copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: MyColors.textPrimary.withValues(alpha: 0.5),
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: GoogleFonts.breeSerif().copyWith(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headlineMedium: GoogleFonts.breeSerif().copyWith(
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headlineSmall: GoogleFonts.breeSerif().copyWith(
      fontSize: 20.0,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    titleLarge: GoogleFonts.breeSerif().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    titleMedium: GoogleFonts.breeSerif().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    titleSmall: GoogleFonts.breeSerif().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    bodyLarge: GoogleFonts.breeSerif().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    bodyMedium: GoogleFonts.breeSerif().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: Colors.white,
    ),
    bodySmall: GoogleFonts.breeSerif().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: Colors.white.withValues(alpha: 0.5),
    ),
    labelLarge: GoogleFonts.breeSerif().copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: Colors.white,
    ),
    labelMedium: GoogleFonts.breeSerif().copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: Colors.white.withValues(alpha: 0.5),
    ),
    labelSmall: GoogleFonts.breeSerif().copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: Colors.white.withValues(alpha: 0.5),
    ),
  );
}
