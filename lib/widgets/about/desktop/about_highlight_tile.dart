import 'package:flutter/material.dart';

import '../../../models/about_highlight.dart';
import '../../../utils/app_color.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/app_durations.dart';
import '../../../utils/text_style.dart';
import '../../common/hover_builder.dart';

/// One "what I bring" tile: a tinted glyph square above a short title and a
/// single supporting line.
///
/// On hover the card lifts, its border and icon warm toward the brand blue, and
/// a soft glow blooms underneath — the same affordance used by the hero's
/// buttons and social icons.
class AboutHighlightTile extends StatelessWidget {
  const AboutHighlightTile({super.key, required this.highlight});

  final AboutHighlight highlight;

  @override
  Widget build(BuildContext context) {
    return HoverBuilder(
      cursor: SystemMouseCursors.basic,
      builder: (context, isHovered) {
        return AnimatedContainer(
          duration: AppDurations.fast,
          curve: Curves.easeOut,
          padding: const EdgeInsets.all(AppDimensions.spaceMD),
          transform: Matrix4.translationValues(0, isHovered ? -4 : 0, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDimensions.radiusLG),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: isHovered
                  ? [
                      AppColors.cardHover.withValues(alpha: 0.9),
                      AppColors.card.withValues(alpha: 0.7),
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
                      blurRadius: 24,
                      offset: const Offset(0, 8),
                    ),
                  ]
                : const [],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _IconBox(icon: highlight.icon, isHovered: isHovered),
              const SizedBox(height: AppDimensions.spaceMD - 4),
              Text(
                highlight.title,
                style: AppTextStyle.withColor(
                  AppTextStyle.h3,
                  AppColors.textPrimary,
                ).copyWith(
                  fontSize: AppDimensions.aboutHighlightTitleFontSize,
                ),
              ),
              const SizedBox(height: AppDimensions.spaceXS + 2),
              Text(
                highlight.body,
                style: AppTextStyle.withColor(
                  AppTextStyle.bodySmall,
                  AppColors.textTertiary,
                ).copyWith(
                  fontSize: AppDimensions.aboutHighlightBodyFontSize,
                  height: 1.5,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/// The rounded, tinted square holding the tile's glyph.
class _IconBox extends StatelessWidget {
  const _IconBox({required this.icon, required this.isHovered});

  final IconData icon;
  final bool isHovered;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: AppDurations.fast,
      curve: Curves.easeOut,
      width: AppDimensions.aboutHighlightIconBoxSize,
      height: AppDimensions.aboutHighlightIconBoxSize,
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
      ),
      child: Center(
        child: Icon(
          icon,
          size: AppDimensions.aboutHighlightIconSize,
          color: isHovered ? AppColors.buttonText : AppColors.primaryLight,
        ),
      ),
    );
  }
}
