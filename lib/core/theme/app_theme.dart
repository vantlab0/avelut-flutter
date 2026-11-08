import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:avelut_flutter/core/theme/squircle_clipper.dart';
import 'colors.dart';

/// Avelut app theme built on off-black / off-white glassmorphism + squircle shapes.
class AppTheme {
  AppTheme._();

  static final ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.offBlackDark,
    cardColor: AppColors.offBlackCard,
    dividerColor: AppColors.grayDark.withOpacity(0.2),
    fontFamily: 'Inter',

    textTheme: TextTheme(
      displayLarge: GoogleFonts.inter(
        fontSize: 32, fontWeight: FontWeight.w700, color: AppColors.pureWhite,
      ),
      displayMedium: GoogleFonts.inter(
        fontSize: 24, fontWeight: FontWeight.w600, color: AppColors.pureWhite,
      ),
      headlineMedium: GoogleFonts.inter(
        fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.pureWhite,
      ),
      titleLarge: GoogleFonts.inter(
        fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.pureWhite,
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.pureWhite,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.grayMedium,
      ),
      labelLarge: GoogleFonts.inter(
        fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.pureWhite,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.brandBlue,
        foregroundColor: AppColors.pureWhite,
        elevation: 0,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SquircleRadius.lg),
        ),
        padding: const EdgeInsets.symmetric(vertical: 14),
        textStyle: GoogleFonts.inter(
          fontSize: 15, fontWeight: FontWeight.w600,
        ),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.pureWhite,
        side: const BorderSide(color: AppColors.grayDark, width: 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SquircleRadius.lg),
        ),
        padding: const EdgeInsets.symmetric(vertical: 14),
      ),
    ),

    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.brandBlue,
        foregroundColor: AppColors.pureWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SquircleRadius.lg),
        ),
        padding: const EdgeInsets.symmetric(vertical: 14),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.offBlackSurface,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(SquircleRadius.lg),
        borderSide: const BorderSide(color: AppColors.grayDark, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(SquircleRadius.lg),
        borderSide: const BorderSide(color: AppColors.grayDark, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(SquircleRadius.lg),
        borderSide: const BorderSide(color: AppColors.brandBlue, width: 1.5),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      hintStyle: GoogleFonts.inter(
        fontSize: 14, color: AppColors.grayDark,
      ),
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.offBlackSurface,
      selectedItemColor: AppColors.brandBlue,
      unselectedItemColor: AppColors.grayDark,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
    ),

    dialogTheme: DialogTheme(
      backgroundColor: AppColors.offBlackSurface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SquircleRadius.xl),
      ),
      elevation: 0,
    ),

    cardTheme: CardTheme(
      color: AppColors.offBlackCard,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SquircleRadius.lg),
      ),
      margin: EdgeInsets.zero,
    ),

    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.brandBlue;
        }
        return AppColors.grayDark;
      }),
      trackColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.brandBlue.withOpacity(0.3);
        }
        return AppColors.grayDark.withOpacity(0.4);
      }),
    ),
  );

  static final ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.offWhiteLight,
    cardColor: AppColors.offWhiteCard,
    dividerColor: AppColors.grayLight,
    fontFamily: 'Inter',

    textTheme: TextTheme(
      displayLarge: GoogleFonts.inter(
        fontSize: 32, fontWeight: FontWeight.w700, color: AppColors.pureBlack,
      ),
      displayMedium: GoogleFonts.inter(
        fontSize: 24, fontWeight: FontWeight.w600, color: AppColors.pureBlack,
      ),
      headlineMedium: GoogleFonts.inter(
        fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.pureBlack,
      ),
      titleLarge: GoogleFonts.inter(
        fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.pureBlack,
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.pureBlack,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.grayDark,
      ),
      labelLarge: GoogleFonts.inter(
        fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.pureBlack,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.brandBlue,
        foregroundColor: AppColors.pureWhite,
        elevation: 0,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SquircleRadius.lg),
        ),
        padding: const EdgeInsets.symmetric(vertical: 14),
        textStyle: GoogleFonts.inter(
          fontSize: 15, fontWeight: FontWeight.w600,
        ),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.pureBlack,
        side: const BorderSide(color: AppColors.grayMedium, width: 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SquircleRadius.lg),
        ),
        padding: const EdgeInsets.symmetric(vertical: 14),
      ),
    ),

    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.brandBlue,
        foregroundColor: AppColors.pureWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SquircleRadius.lg),
        ),
        padding: const EdgeInsets.symmetric(vertical: 14),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.offWhiteCard,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(SquircleRadius.lg),
        borderSide: const BorderSide(color: AppColors.grayMedium, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(SquircleRadius.lg),
        borderSide: const BorderSide(color: AppColors.grayMedium, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(SquircleRadius.lg),
        borderSide: const BorderSide(color: AppColors.brandBlue, width: 1.5),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      hintStyle: GoogleFonts.inter(
        fontSize: 14, color: AppColors.grayDark,
      ),
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.offWhiteSurface,
      selectedItemColor: AppColors.brandBlue,
      unselectedItemColor: AppColors.grayDark,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
    ),

    dialogTheme: DialogTheme(
      backgroundColor: AppColors.offWhiteCard,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SquircleRadius.xl),
      ),
      elevation: 0,
    ),

    cardTheme: CardTheme(
      color: AppColors.offWhiteCard,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SquircleRadius.lg),
      ),
      margin: EdgeInsets.zero,
    ),

    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.brandBlue;
        }
        return AppColors.grayMedium;
      }),
      trackColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.brandBlue.withOpacity(0.3);
        }
        return AppColors.grayLight;
      }),
    ),
  );
}
