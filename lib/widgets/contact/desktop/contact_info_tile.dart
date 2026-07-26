import 'package:flutter/material.dart';

import '../../../models/contact_detail.dart';
import '../../../utils/app_color.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/app_durations.dart';
import '../../../utils/text_style.dart';
import '../../common/hover_builder.dart';

/// One row of the contact info column: a tinted glyph square, a small caption,
/// and the detail itself.
///
/// Tiles carrying a [ContactDetail.url] behave like the service cards — they
/// lift, warm toward the brand blue and take a click cursor on hover. Purely
/// informational tiles (location, response time) stay static, so hover always
/// means "this goes somewhere".
class ContactInfoTile extends StatelessWidget {
  const ContactInfoTile({
    super.key,
    required this.detail,
    required this.onOpenUrl,
    this.padding = AppDimensions.contactInfoTilePadding,
    this.iconBoxSize = AppDimensions.contactInfoIconBoxSize,
    this.iconSize = AppDimensions.contactInfoIconSize,
    this.labelFontSize = AppDimensions.contactInfoLabelFontSize,
    this.valueFontSize = AppDimensions.contactInfoValueFontSize,
  });

  final ContactDetail detail;

  /// Opens [ContactDetail.url]; never called for informational tiles.
  final ValueChanged<String> onOpenUrl;

  final double padding;
  final double iconBoxSize;
  final double iconSize;
  final double labelFontSize;
  final double valueFontSize;

  @override
  Widget build(BuildContext context) {
    final url = detail.url;

    return HoverBuilder(
      cursor: url == null ? MouseCursor.defer : SystemMouseCursors.click,
      onTap: url == null ? null : () => onOpenUrl(url),
      builder: (context, isHovered) {
        // Informational tiles opt out of the hover treatment entirely.
        final isActive = url != null && isHovered;

        return AnimatedContainer(
          duration: AppDurations.fast,
          curve: Curves.easeOut,
          padding: EdgeInsets.all(padding),
          transform: Matrix4.translationValues(
            0,
            isActive ? -AppDimensions.contactInfoTileHoverLift : 0,
            0,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              AppDimensions.contactInfoTileRadius,
            ),
            color: isActive
                ? AppColors.cardHover.withValues(alpha: 0.75)
                : AppColors.card.withValues(alpha: 0.55),
            border: Border.all(
              color: isActive
                  ? AppColors.primary.withValues(alpha: 0.55)
                  : AppColors.border.withValues(alpha: 0.9),
              width: AppDimensions.borderThin,
            ),
            boxShadow: isActive
                ? [
                    BoxShadow(
                      color: AppColors.glow.withValues(alpha: 0.28),
                      blurRadius: 24,
                      offset: const Offset(0, 10),
                    ),
                  ]
                : const [],
          ),
          child: Row(
            children: [
              AnimatedContainer(
                duration: AppDurations.fast,
                curve: Curves.easeOut,
                width: iconBoxSize,
                height: iconBoxSize,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppDimensions.radiusMD),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.primary.withValues(alpha: isActive ? 0.32 : 0.18),
                      AppColors.accent.withValues(alpha: isActive ? 0.20 : 0.08),
                    ],
                  ),
                  border: Border.all(
                    color: AppColors.primary.withValues(
                      alpha: isActive ? 0.6 : 0.3,
                    ),
                    width: AppDimensions.borderThin,
                  ),
                ),
                child: Icon(
                  detail.icon,
                  size: iconSize,
                  color: isActive
                      ? AppColors.accentGlow
                      : AppColors.primaryLight,
                ),
              ),
              const SizedBox(width: AppDimensions.spaceMD),

              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      detail.label.toUpperCase(),
                      style: AppTextStyle.withColor(
                        AppTextStyle.labelMedium,
                        AppColors.textTertiary,
                      ).copyWith(fontSize: labelFontSize, letterSpacing: 1.6),
                    ),
                    const SizedBox(height: AppDimensions.spaceXS),
                    AnimatedDefaultTextStyle(
                      duration: AppDurations.fast,
                      curve: Curves.easeOut,
                      style: AppTextStyle.withColor(
                        AppTextStyle.bodyMedium,
                        isActive
                            ? AppColors.accentGlow
                            : AppColors.textSecondary,
                      ).copyWith(
                        fontSize: valueFontSize,
                        fontWeight: FontWeight.w500,
                        height: 1.4,
                      ),
                      child: Text(detail.value),
                    ),
                  ],
                ),
              ),

              // Only links get the trailing chevron, matching the hover rule.
              if (url != null)
                AnimatedOpacity(
                  duration: AppDurations.fast,
                  opacity: isActive ? 1 : 0.45,
                  child: Icon(
                    Icons.arrow_outward_rounded,
                    size: AppDimensions.serviceFeatureIconSize,
                    color: AppColors.primaryLight,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
