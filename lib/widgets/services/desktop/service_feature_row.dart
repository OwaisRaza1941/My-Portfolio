import 'package:flutter/material.dart';

import '../../../utils/app_color.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/app_durations.dart';
import '../../../utils/text_style.dart';

/// One deliverable line inside a service card: a small check glyph followed by
/// the feature text.
///
/// The row has no hover state of its own — it brightens with the card around
/// it, so the whole card reads as a single surface reacting to the pointer.
class ServiceFeatureRow extends StatelessWidget {
  const ServiceFeatureRow({
    super.key,
    required this.label,
    this.isCardHovered = false,
    this.fontSize = AppDimensions.serviceFeatureFontSize,
    this.iconSize = AppDimensions.serviceFeatureIconSize,
  });

  final String label;

  /// Whether the parent card is currently hovered.
  final bool isCardHovered;

  final double fontSize;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Nudged down a hair so the glyph sits on the text baseline rather than
        // on the line box top.
        Padding(
          padding: const EdgeInsets.only(top: 1.5),
          child: AnimatedContainer(
            duration: AppDurations.fast,
            curve: Curves.easeOut,
            width: iconSize,
            height: iconSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isCardHovered
                  ? AppColors.primary.withValues(alpha: 0.9)
                  : AppColors.primary.withValues(alpha: 0.18),
              border: Border.all(
                color: AppColors.primary.withValues(
                  alpha: isCardHovered ? 0.0 : 0.4,
                ),
                width: AppDimensions.borderThin,
              ),
            ),
            child: Icon(
              Icons.check_rounded,
              size: iconSize - 5,
              color: isCardHovered
                  ? AppColors.buttonText
                  : AppColors.primaryLight,
            ),
          ),
        ),
        const SizedBox(width: AppDimensions.serviceFeatureIconGap),
        Expanded(
          child: Text(
            label,
            style: AppTextStyle.withColor(
              AppTextStyle.bodySmall,
              isCardHovered ? AppColors.textSecondary : AppColors.textTertiary,
            ).copyWith(fontSize: fontSize, height: 1.45),
          ),
        ),
      ],
    );
  }
}
