import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import '../../utils/app_dimensions.dart';
import '../../utils/app_durations.dart';
import '../../utils/text_style.dart';
import '../common/hover_builder.dart';

/// The primary solid call-to-action button (e.g. "Hire Me").
///
/// On hover it lifts slightly, scales up, brightens, and blooms a soft blue
/// glow — the signature interaction of the design system. All motion is driven
/// by [AnimatedContainer] / [AnimatedScale] for buttery, implicit transitions.
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
  });

  final String label;
  final VoidCallback onPressed;

  /// Optional leading icon (FontAwesome or Material).
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return HoverBuilder(
      onTap: onPressed,
      builder: (context, isHovered) {
        return AnimatedScale(
          scale: isHovered ? 1.04 : 1.0,
          duration: AppDurations.fast,
          curve: Curves.easeOut,
          child: AnimatedContainer(
            duration: AppDurations.fast,
            curve: Curves.easeOut,
            height: AppDimensions.buttonHeight,
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.buttonHorizontalPadding,
            ),
            transform: Matrix4.translationValues(0, isHovered ? -2 : 0, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimensions.radiusMD),
              gradient: LinearGradient(
                colors: isHovered
                    ? const [AppColors.primaryLight, AppColors.primary]
                    : const [AppColors.primary, AppColors.primaryDark],
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.glow.withValues(
                    alpha: isHovered ? 0.9 : 0.4,
                  ),
                  blurRadius: isHovered ? 28 : 16,
                  spreadRadius: isHovered ? 1 : 0,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: _ButtonContent(label: label, icon: icon),
          ),
        );
      },
    );
  }
}

/// Row of icon + label shared by the button variants.
class _ButtonContent extends StatelessWidget {
  const _ButtonContent({required this.label, this.icon});

  final String label;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null) ...[
          Icon(icon, size: 18, color: AppColors.buttonText),
          const SizedBox(width: AppDimensions.buttonIconGap),
        ],
        Text(
          label,
          style: AppTextStyle.withColor(
            AppTextStyle.buttonLarge,
            AppColors.buttonText,
          ),
        ),
      ],
    );
  }
}
