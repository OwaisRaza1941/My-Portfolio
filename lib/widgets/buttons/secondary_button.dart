import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import '../../utils/app_dimensions.dart';
import '../../utils/app_durations.dart';
import '../../utils/text_style.dart';
import '../common/hover_builder.dart';

/// The secondary outlined button (e.g. "Download CV").
///
/// It reads as a "ghost" action: transparent by default with a thin border,
/// then on hover its border and text brighten to the accent color and a subtle
/// tinted fill and glow fade in — clearly interactive but visually subordinate
/// to [PrimaryButton].
class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
  });

  final String label;
  final VoidCallback onPressed;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return HoverBuilder(
      onTap: onPressed,
      builder: (context, isHovered) {
        final foreground = isHovered
            ? AppColors.primaryLight
            : AppColors.textSecondary;

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
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimensions.radiusMD),
              color: isHovered
                  ? AppColors.primary.withValues(alpha: 0.08)
                  : Colors.transparent,
              border: Border.all(
                color: isHovered
                    ? AppColors.primary.withValues(alpha: 0.9)
                    : AppColors.border,
                width: AppDimensions.borderThick,
              ),
              boxShadow: isHovered
                  ? [
                      BoxShadow(
                        color: AppColors.glow.withValues(alpha: 0.35),
                        blurRadius: 24,
                        offset: const Offset(0, 6),
                      ),
                    ]
                  : const [],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) ...[
                  Icon(icon, size: 18, color: foreground),
                  const SizedBox(width: AppDimensions.buttonIconGap),
                ],
                Text(
                  label,
                  style: AppTextStyle.withColor(
                    AppTextStyle.buttonLarge,
                    foreground,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}