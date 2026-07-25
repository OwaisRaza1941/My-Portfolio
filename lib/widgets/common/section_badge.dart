import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import '../../utils/app_dimensions.dart';
import '../../utils/text_style.dart';
import 'glass_card.dart';

/// The small frosted eyebrow pill that introduces a section, e.g. "👋 ABOUT ME".
///
/// It is the section-level sibling of the hero's status badge: same glass
/// surface and accent border, but led by an emoji instead of a pulsing dot, so
/// every section header on the site opens with the same visual gesture.
class SectionBadge extends StatelessWidget {
  const SectionBadge({super.key, required this.label, this.emoji, this.icon});

  /// Badge text. Rendered upper-case with wide tracking.
  final String label;

  /// Optional leading emoji (e.g. "👋").
  final String? emoji;

  /// Optional leading glyph, used when the badge has no [emoji].
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.heroBadgeHorizontalPadding,
        vertical: AppDimensions.heroBadgeVerticalPadding,
      ),
      borderColor: AppColors.primary.withValues(alpha: 0.4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (emoji != null) ...[
            Text(emoji!, style: AppTextStyle.emoji),
            const SizedBox(width: AppDimensions.spaceSM),
          ] else if (icon != null) ...[
            Icon(icon, size: 15, color: AppColors.primaryLight),
            const SizedBox(width: AppDimensions.spaceSM),
          ],
          Text(
            label.toUpperCase(),
            style: AppTextStyle.withColor(
              AppTextStyle.labelMedium,
              AppColors.textSecondary,
            ).copyWith(letterSpacing: 2.5, fontSize: 12.5),
          ),
        ],
      ),
    );
  }
}
