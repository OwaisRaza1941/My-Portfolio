import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import '../../utils/app_dimensions.dart';

/// A short horizontal accent bar beneath a section heading, brightest in the
/// middle so it reads as a soft glow rather than a hard divider.
///
/// Shared by every section header so they all close the same way.
class HeadingUnderline extends StatelessWidget {
  const HeadingUnderline({super.key});

  static const double _width = 96;
  static const double _height = 4;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _width,
      height: _height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimensions.radiusPill),
        gradient: const LinearGradient(
          colors: [
            Color(0x003B82F6),
            AppColors.primaryLight,
            AppColors.accentGlow,
            Color(0x003B82F6),
          ],
          stops: [0.0, 0.35, 0.65, 1.0],
        ),
        boxShadow: [
          BoxShadow(color: AppColors.glow.withValues(alpha: 0.7), blurRadius: 14),
        ],
      ),
    );
  }
}
