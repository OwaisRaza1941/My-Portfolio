import 'package:flutter/material.dart';

import '../../../models/skill_category.dart';
import '../../../utils/app_color.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/app_durations.dart';
import '../../../utils/text_style.dart';
import '../../common/hover_builder.dart';
import 'skill_chip.dart';

/// One skills card: a tinted glyph square and the group title on top, then the
/// group's skills as a cloud of chips.
///
/// On hover the card lifts, its border and glyph warm toward the brand blue and
/// a soft glow blooms underneath — the same affordance the about highlights and
/// the hero buttons use.
class SkillCategoryCard extends StatelessWidget {
  const SkillCategoryCard({
    super.key,
    required this.category,
    this.titleFontSize = AppDimensions.skillsCardTitleFontSize,
    this.chipFontSize = AppDimensions.skillsChipFontSize,
    this.padding = AppDimensions.skillsCardPadding,
    this.iconBoxSize = AppDimensions.skillsCardIconBoxSize,
    this.iconSize = AppDimensions.skillsCardIconSize,
  });

  final SkillCategory category;

  /// Typography and spacing overrides so tablet / mobile can reuse the card.
  final double titleFontSize;
  final double chipFontSize;
  final double padding;
  final double iconBoxSize;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return HoverBuilder(
      cursor: SystemMouseCursors.basic,
      builder: (context, isHovered) {
        return AnimatedContainer(
          duration: AppDurations.fast,
          curve: Curves.easeOut,
          padding: EdgeInsets.all(padding),
          transform: Matrix4.translationValues(
            0,
            isHovered ? -AppDimensions.skillsCardHoverLift : 0,
            0,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDimensions.skillsCardRadius),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: isHovered
                  ? [
                      AppColors.cardHover.withValues(alpha: 0.92),
                      AppColors.card.withValues(alpha: 0.72),
                    ]
                  : [
                      AppColors.card.withValues(alpha: 0.55),
                      AppColors.surface.withValues(alpha: 0.4),
                    ],
            ),
            border: Border.all(
              color: isHovered
                  ? AppColors.primary.withValues(alpha: 0.7)
                  : AppColors.border.withValues(alpha: 0.8),
              width: AppDimensions.borderThin,
            ),
            boxShadow: isHovered
                ? [
                    BoxShadow(
                      color: AppColors.glow.withValues(alpha: 0.35),
                      blurRadius: 28,
                      offset: const Offset(0, 10),
                    ),
                  ]
                : const [],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _IconBox(
                    icon: category.icon,
                    isHovered: isHovered,
                    boxSize: iconBoxSize,
                    glyphSize: iconSize,
                  ),
                  const SizedBox(width: AppDimensions.spaceMD - 2),
                  Expanded(
                    child: Text(
                      category.title,
                      style: AppTextStyle.withColor(
                        AppTextStyle.h3,
                        AppColors.textPrimary,
                      ).copyWith(fontSize: titleFontSize, height: 1.25),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppDimensions.skillsCardHeaderGap),

              // A [Wrap] hands its children unbounded width, so the chips are
              // told how wide the card actually is — otherwise a long label on
              // a narrow phone would run past the card edge.
              LayoutBuilder(
                builder: (context, constraints) {
                  return Wrap(
                    spacing: AppDimensions.skillsChipSpacing,
                    runSpacing: AppDimensions.skillsChipRunSpacing,
                    children: [
                      for (final skill in category.skills)
                        SkillChip(
                          label: skill,
                          isCardHovered: isHovered,
                          fontSize: chipFontSize,
                          maxWidth: constraints.maxWidth,
                        ),
                    ],
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

/// The rounded, tinted square holding the card's glyph.
class _IconBox extends StatelessWidget {
  const _IconBox({
    required this.icon,
    required this.isHovered,
    required this.boxSize,
    required this.glyphSize,
  });

  final IconData icon;
  final bool isHovered;
  final double boxSize;
  final double glyphSize;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: AppDurations.fast,
      curve: Curves.easeOut,
      width: boxSize,
      height: boxSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimensions.radiusMD),
        gradient: LinearGradient(
          colors: isHovered
              ? const [AppColors.primaryLight, AppColors.primary]
              : [
                  AppColors.primary.withValues(alpha: 0.18),
                  AppColors.accent.withValues(alpha: 0.10),
                ],
        ),
        border: Border.all(
          color: AppColors.primary.withValues(alpha: isHovered ? 0.0 : 0.35),
          width: AppDimensions.borderThin,
        ),
        boxShadow: isHovered
            ? [
                BoxShadow(
                  color: AppColors.glow.withValues(alpha: 0.5),
                  blurRadius: 16,
                ),
              ]
            : const [],
      ),
      child: Center(
        child: Icon(
          icon,
          size: glyphSize,
          color: isHovered ? AppColors.buttonText : AppColors.primaryLight,
        ),
      ),
    );
  }
}
