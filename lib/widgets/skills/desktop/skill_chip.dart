import 'package:flutter/material.dart';

import '../../../utils/app_color.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/app_durations.dart';
import '../../../utils/text_style.dart';
import '../../common/hover_builder.dart';

/// A single skill pill — a small accent dot followed by the skill name.
///
/// The chip warms toward the brand blue on its own hover, and also lifts its
/// tint when the card around it is hovered, so the whole card reads as one
/// surface reacting to the pointer.
class SkillChip extends StatelessWidget {
  const SkillChip({
    super.key,
    required this.label,
    this.isCardHovered = false,
    this.fontSize = AppDimensions.skillsChipFontSize,
    this.maxWidth = double.infinity,
  });

  /// The skill name (e.g. "Firebase Firestore").
  final String label;

  /// Whether the parent card is currently hovered.
  final bool isCardHovered;

  final double fontSize;

  /// Widest the pill may grow. A [Wrap] hands its children unbounded width, so
  /// without this a long label would run past the card edge instead of wrapping
  /// onto a second line.
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return HoverBuilder(
      cursor: SystemMouseCursors.basic,
      builder: (context, isHovered) {
        // A chip is "active" either on its own hover or through its card.
        final isLit = isHovered || isCardHovered;

        return AnimatedContainer(
          duration: AppDurations.fast,
          curve: Curves.easeOut,
          constraints: BoxConstraints(maxWidth: maxWidth),
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.skillsChipHorizontalPadding,
            vertical: AppDimensions.skillsChipVerticalPadding,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDimensions.radiusPill),
            color: isHovered
                ? AppColors.primary.withValues(alpha: 0.22)
                : AppColors.surface.withValues(alpha: isLit ? 0.75 : 0.55),
            border: Border.all(
              color: isHovered
                  ? AppColors.primaryLight.withValues(alpha: 0.8)
                  : AppColors.border.withValues(alpha: isLit ? 0.95 : 0.7),
              width: AppDimensions.borderThin,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _ChipDot(isLit: isLit),
              const SizedBox(width: AppDimensions.skillsChipDotGap),
              Flexible(
                child: Text(
                  label,
                  style: AppTextStyle.withColor(
                    AppTextStyle.bodySmall,
                    isLit ? AppColors.textPrimary : AppColors.textSecondary,
                  ).copyWith(fontSize: fontSize, height: 1.2),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/// The tiny bullet that leads a chip label, glowing once the chip is lit.
class _ChipDot extends StatelessWidget {
  const _ChipDot({required this.isLit});

  final bool isLit;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: AppDurations.fast,
      curve: Curves.easeOut,
      width: AppDimensions.skillsChipDotSize,
      height: AppDimensions.skillsChipDotSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isLit ? AppColors.accentGlow : AppColors.primary,
        boxShadow: isLit
            ? [
                BoxShadow(
                  color: AppColors.glow.withValues(alpha: 0.9),
                  blurRadius: 8,
                ),
              ]
            : const [],
      ),
    );
  }
}
