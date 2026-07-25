import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../models/tech_badge.dart';
import '../../../utils/app_color.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/app_durations.dart';
import '../../../utils/text_style.dart';
import '../../common/glass_card.dart';
import '../../common/hover_builder.dart';

/// A small frosted pill naming one technology, tinted with that technology's
/// brand color. These float around the about-section code window to hint at the
/// stack without spelling it out in prose.
///
/// Hovering lifts the pill and blooms its brand glow, matching the interaction
/// language of the hero's social icons.
class TechBadgePill extends StatelessWidget {
  const TechBadgePill({super.key, required this.badge});

  final TechBadge badge;

  @override
  Widget build(BuildContext context) {
    return HoverBuilder(
      cursor: SystemMouseCursors.basic,
      builder: (context, isHovered) {
        return AnimatedContainer(
          duration: AppDurations.fast,
          curve: Curves.easeOut,
          transform: Matrix4.translationValues(0, isHovered ? -3 : 0, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDimensions.radiusPill),
            boxShadow: [
              BoxShadow(
                color: badge.color.withValues(alpha: isHovered ? 0.45 : 0.22),
                blurRadius: isHovered ? 26 : 16,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: GlassCard(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.spaceMD - 2,
              vertical: AppDimensions.spaceSM + 1,
            ),
            backgroundOpacity: 0.85,
            borderColor: badge.color.withValues(alpha: isHovered ? 0.75 : 0.4),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                FaIcon(
                  badge.icon,
                  size: AppDimensions.aboutTechBadgeIconSize,
                  color: badge.color,
                ),
                const SizedBox(width: AppDimensions.spaceSM),
                Text(
                  badge.label,
                  style: AppTextStyle.withColor(
                    AppTextStyle.labelMedium,
                    AppColors.textPrimary,
                  ).copyWith(fontSize: 13, letterSpacing: 0.3),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
