import 'package:flutter/material.dart';

import '../../../utils/app_color.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/text_style.dart';
import '../../common/glass_card.dart';
import '../../common/pulsing_dot.dart';

/// The small glass "status" pill shown above the hero heading, e.g.
/// "• Flutter Developer". Combines a pulsing accent dot with a label inside a
/// frosted [GlassCard].
class HeroBadge extends StatelessWidget {
  const HeroBadge({super.key, required this.label});

  final String label;

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
          const PulsingDot(color: AppColors.primaryLight),
          const SizedBox(width: AppDimensions.spaceSM),
          Text(
            label,
            style: AppTextStyle.withColor(
              AppTextStyle.labelMedium,
              AppColors.textSecondary,
            ).copyWith(letterSpacing: 1),
          ),
        ],
      ),
    );
  }
}
