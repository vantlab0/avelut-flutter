import 'package:flutter/material.dart';

/// Avelut design system colors — off-black / off-white glassmorphism palette.
abstract class AppColors {
  AppColors._();

  // ── Backgrounds ──
  static const Color offBlackDark = Color(0xFF0F0F0F);
  static const Color offBlackSurface = Color(0xFF1A1A1A);
  static const Color offBlackCard = Color(0xFF232323);

  static const Color offWhiteLight = Color(0xFFFAFAFA);
  static const Color offWhiteSurface = Color(0xFFF5F5F7);
  static const Color offWhiteCard = Color(0xFFFFFFFF);

  static const Color pureBlack = Color(0xFF000000);
  static const Color pureWhite = Color(0xFFFFFFFF);

  // ── Grays ──
  static const Color grayLight = Color(0xFFE5E5EA);
  static const Color grayMedium = Color(0xFFC7C7CC);
  static const Color grayDark = Color(0xFF8E8E93);

  // ── Accent / brand ──
  static const Color brandBlue = Color(0xFF009EE2);
  static const Color brandBlueDark = Color(0xFF0070B8);

  // ── Semantic ──
  static const Color success = Color(0xFF34C759);
  static const Color warning = Color(0xFFFFCC00);
  static const Color error = Color(0xFFFF3B30);
  static const Color info = Color(0xFF0A84FF);
}

// ── Dark theme color resolver ──
extension DarkColors on BuildContext? {
  Color get surface => AppColors.offBlackDark;
  Color get surfaceElevated => AppColors.offBlackSurface;
  Color get card => AppColors.offBlackCard;
  Color get onSurface => AppColors.pureWhite;
  Color get onSurfaceVariant => AppColors.grayMedium;
  Color get border => AppColors.grayDark.withOpacity(0.25);
  Color get glassSurface => AppColors.offBlackSurface.withOpacity(0.7);
  Color get glassBorder => AppColors.pureWhite.withOpacity(0.12);
}

// ── Light theme color resolver ──
extension LightColors on BuildContext? {
  Color get surface => AppColors.offWhiteLight;
  Color get surfaceElevated => AppColors.offWhiteSurface;
  Color get card => AppColors.offWhiteCard;
  Color get onSurface => AppColors.pureBlack;
  Color get onSurfaceVariant => AppColors.grayDark;
  Color get border => AppColors.grayLight;
  Color get glassSurface => AppColors.pureWhite.withOpacity(0.8);
  Color get glassBorder => AppColors.grayDark.withOpacity(0.15);
}
