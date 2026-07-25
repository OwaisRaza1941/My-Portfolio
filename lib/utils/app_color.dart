import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // ===========================
  // Brand Colors
  // ===========================

  static const Color primary = Color(0xFF2563EB);
  static const Color primaryLight = Color(0xFF3B82F6);
  static const Color primaryDark = Color(0xFF1D4ED8);

  static const Color accent = Color(0xFF60A5FA);
  static const Color accentGlow = Color(0xFF93C5FD);

  // ===========================
  // Background
  // ===========================

  static const Color scaffoldBackground = Color(0xFF0B1120);

  static const Color surface = Color(0xFF111827);

  static const Color card = Color(0xFF161E2E);

  static const Color cardHover = Color(0xFF1E293B);

  static const Color section = Color(0xFF0F172A);

  // ===========================
  // Borders
  // ===========================

  static const Color border = Color(0xFF293548);

  static const Color borderLight = Color(0xFF374151);

  // ===========================
  // Text
  // ===========================

  static const Color textPrimary = Color(0xFFFFFFFF);

  static const Color textSecondary = Color(0xFFD1D5DB);

  static const Color textTertiary = Color(0xFF9CA3AF);

  static const Color textDisabled = Color(0xFF6B7280);

  // ===========================
  // Buttons
  // ===========================

  static const Color buttonPrimary = primary;

  static const Color buttonHover = primaryLight;

  static const Color buttonPressed = primaryDark;

  static const Color buttonText = Colors.white;

  static const Color buttonOutline = primary;

  // ===========================
  // Status
  // ===========================

  static const Color success = Color(0xFF22C55E);

  static const Color warning = Color(0xFFF59E0B);

  static const Color error = Color(0xFFEF4444);

  static const Color info = Color(0xFF38BDF8);

  // ===========================
  // Effects
  // ===========================

  static const Color glow = Color(0x663B82F6);

  static const Color shadow = Color(0x33000000);

  static const Color divider = Color(0xFF273244);

  // ===========================
  // Tech Brands
  // ===========================

  /// Brand tints for the floating stack badges. Each is the lighter end of the
  /// official brand color so it stays legible on the dark surface.
  static const Color flutterBrand = Color(0xFF54C5F8);

  static const Color dartBrand = Color(0xFF29B6F6);

  static const Color firebaseBrand = Color(0xFFFFCA28);

  // ===========================
  // Code Syntax (about illustration)
  // ===========================

  /// Palette for the faux Dart snippet inside the about-section code window.
  /// Kept deliberately close to the brand blues so the illustration reads as
  /// part of the design rather than a screenshot pasted on top of it.
  static const Color codeWindowBackground = Color(0xFF0A1020);

  static const Color codeKeyword = Color(0xFFC084FC);

  static const Color codeType = Color(0xFF60A5FA);

  static const Color codeString = Color(0xFF86EFAC);

  static const Color codeAnnotation = Color(0xFFFBBF24);

  static const Color codePunctuation = Color(0xFF94A3B8);

  static const Color codeComment = Color(0xFF64748B);

  static const Color codeText = Color(0xFFE2E8F0);

  static const Color codeLineNumber = Color(0xFF475569);

  // ===========================
  // Social
  // ===========================

  static const Color github = Color(0xFFFFFFFF);

  static const Color linkedin = Color(0xFF0A66C2);

  static const Color gmail = Color(0xFFEA4335);

  static const Color instagram = Color(0xFFE1306C);
  static const Color fiver = Color(0xFF1DBF73);
}