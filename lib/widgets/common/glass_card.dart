import 'dart:ui';

import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import '../../utils/app_dimensions.dart';

/// A premium frosted-glass container: a subtly translucent surface with a
/// blur behind it, a thin luminous border, and a soft inner gradient.
///
/// Reused for the availability badge, hero badge, and any floating surface that
/// should read as "glass" against the animated background.
class GlassCard extends StatelessWidget {
  const GlassCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.symmetric(
      horizontal: AppDimensions.spaceMD,
      vertical: AppDimensions.spaceSM,
    ),
    this.borderRadius = AppDimensions.radiusPill,
    this.blurSigma = 12,
    this.borderColor,
    this.backgroundOpacity = 0.55,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final double blurSigma;

  /// Overrides the default border color (e.g. to tint the glass with an accent).
  final Color? borderColor;

  /// Opacity applied to the card surface color.
  final double backgroundOpacity;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(borderRadius);

    return ClipRRect(
      borderRadius: radius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            borderRadius: radius,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.card.withValues(alpha: backgroundOpacity),
                AppColors.surface.withValues(alpha: backgroundOpacity * 0.7),
              ],
            ),
            border: Border.all(
              color: borderColor ?? AppColors.border.withValues(alpha: 0.9),
              width: AppDimensions.borderThin,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
