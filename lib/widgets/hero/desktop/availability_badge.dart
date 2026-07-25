import 'package:flutter/material.dart';

import '../../../utils/app_color.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/app_strings.dart';
import '../../../utils/text_style.dart';
import '../../common/glass_card.dart';
import '../../common/pulsing_dot.dart';

/// A small floating glass chip that reads "• Available for work", overlaid on
/// the profile image to signal the developer is open to opportunities.
class AvailabilityBadge extends StatelessWidget {
  const AvailabilityBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.spaceMD,
        vertical: AppDimensions.spaceSM + 2,
      ),
      borderColor: AppColors.success.withValues(alpha: 0.5),
      backgroundOpacity: 0.75,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const PulsingDot(color: AppColors.success),
          const SizedBox(width: AppDimensions.spaceSM),
          Text(
            AppStrings.availability,
            style: AppTextStyle.withColor(
              AppTextStyle.buttonSmall,
              AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
