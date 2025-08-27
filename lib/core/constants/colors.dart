import 'package:flutter/material.dart';

class AppColors {
  // Core brand colors
  static const Color primary = Color(0xFF1D2A39); // Main brand/navy
  static const Color accent = Color(0xFF007AFF);  // Links, active highlights

  // Backgrounds
  static const Color background = Color(0xFFFFFFFF); // Default background
  static const Color surface = Color(0xFFF5F5F7);   // Cards, containers

  // Text colors
  static const Color textPrimary = Color(0xFF1D2A39);   // Dark text
  static const Color textSecondary = Color(0xFF8E8E93); // Subtitles, hints
  static const Color textWhite = Color(0xFFFFFFFF);     // On dark bg

  // Borders
  static const Color borderLight = Color(0xFFE5E5EA);   // Light border (inputs/cards)
  static const Color borderDefault = Color(0xFF8E8E93); // Neutral gray border
  static const Color borderFocus = accent;              // Active/focus state
  static const Color borderError = Color(0xFFFF3B30);   // Error state
  static const Color borderSuccess = Color(0xFF34C759); // Success state

  // Action buttons
  static const Color buttonPrimaryBg = primary;
  static const Color buttonPrimaryText = textWhite;

  static const Color buttonSecondaryBg = background;
  static const Color buttonSecondaryText = textSecondary;
  static const Color buttonSecondaryBorder = borderDefault;

  // Status colors
  static const Color success = Color(0xFF34C759); // Green (approved, done)
  static const Color error = Color(0xFFFF3B30);   // Red (errors, alerts)
  static const Color warning = Color(0xFFFF9500); // Orange (warnings, pending)
  static const Color info = Color(0xFF5AC8FA);    // Light blue (information)

  // Others
  static const Color disabled = Color(0xFFBDBDBD); // Disabled buttons/icons
  static const Color shadow = Color(0x1A000000);   // Light black shadow
}


