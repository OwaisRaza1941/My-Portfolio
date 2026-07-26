import 'package:flutter/material.dart';

import '../../../models/service_item.dart';
import '../../../utils/app_color.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/app_durations.dart';
import '../../../utils/text_style.dart';
import '../../common/hover_builder.dart';
import 'service_feature_row.dart';

/// One service card: a tinted glyph square with a faint index watermark beside
/// it, the service name, a short pitch, and the concrete deliverables as a
/// checked list.
///
/// On hover the card lifts, its border and glyph warm toward the brand blue, a
/// soft glow blooms underneath and an accent rail sweeps across the top edge —
/// the same affordance the skill cards and hero buttons use, one notch louder
/// because these cards are the page's sales pitch.
class ServiceCard extends StatelessWidget {
  const ServiceCard({
    super.key,
    required this.service,
    required this.index,
    this.titleFontSize = AppDimensions.serviceCardTitleFontSize,
    this.bodyFontSize = AppDimensions.serviceCardBodyFontSize,
    this.featureFontSize = AppDimensions.serviceFeatureFontSize,
    this.padding = AppDimensions.serviceCardPadding,
    this.iconBoxSize = AppDimensions.serviceCardIconBoxSize,
    this.iconSize = AppDimensions.serviceCardIconSize,
    this.indexFontSize = AppDimensions.serviceCardIndexFontSize,
  });

  final ServiceItem service;

  /// Zero-based position in the grid, rendered as the "01" watermark.
  final int index;

  /// Typography and spacing overrides so tablet / mobile can reuse the card.
  final double titleFontSize;
  final double bodyFontSize;
  final double featureFontSize;
  final double padding;
  final double iconBoxSize;
  final double iconSize;
  final double indexFontSize;

  /// The watermark reads "01", "02", … rather than "1", "2".
  String get _label => (index + 1).toString().padLeft(2, '0');

  @override
  Widget build(BuildContext context) {
    return HoverBuilder(
      cursor: SystemMouseCursors.basic,
      builder: (context, isHovered) {
        return AnimatedContainer(
          duration: AppDurations.fast,
          curve: Curves.easeOut,
          transform: Matrix4.translationValues(
            0,
            isHovered ? -AppDimensions.serviceCardHoverLift : 0,
            0,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              AppDimensions.serviceCardRadius,
            ),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: isHovered
                  ? [
                      AppColors.cardHover.withValues(alpha: 0.95),
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
                      color: AppColors.glow.withValues(alpha: 0.38),
                      blurRadius: 32,
                      offset: const Offset(0, 12),
                    ),
                  ]
                : const [],
          ),

          // Clipped so the accent rail follows the rounded top corners instead
          // of squaring them off.
          child: ClipRRect(
            borderRadius: BorderRadius.circular(
              AppDimensions.serviceCardRadius - 1,
            ),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.all(padding),
                  child: _CardBody(
                    service: service,
                    label: _label,
                    isHovered: isHovered,
                    titleFontSize: titleFontSize,
                    bodyFontSize: bodyFontSize,
                    featureFontSize: featureFontSize,
                    iconBoxSize: iconBoxSize,
                    iconSize: iconSize,
                    indexFontSize: indexFontSize,
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: _AccentRail(isHovered: isHovered),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

/// Everything inside the card padding: the glyph + index row, the title, the
/// pitch, and the feature list.
class _CardBody extends StatelessWidget {
  const _CardBody({
    required this.service,
    required this.label,
    required this.isHovered,
    required this.titleFontSize,
    required this.bodyFontSize,
    required this.featureFontSize,
    required this.iconBoxSize,
    required this.iconSize,
    required this.indexFontSize,
  });

  final ServiceItem service;
  final String label;
  final bool isHovered;
  final double titleFontSize;
  final double bodyFontSize;
  final double featureFontSize;
  final double iconBoxSize;
  final double iconSize;
  final double indexFontSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _IconBox(
              icon: service.icon,
              isHovered: isHovered,
              boxSize: iconBoxSize,
              glyphSize: iconSize,
            ),
            const Spacer(),
            _IndexWatermark(
              label: label,
              isHovered: isHovered,
              fontSize: indexFontSize,
            ),
          ],
        ),
        const SizedBox(height: AppDimensions.serviceCardIconGap),

        Text(
          service.title,
          style: AppTextStyle.withColor(
            AppTextStyle.h3,
            AppColors.textPrimary,
          ).copyWith(fontSize: titleFontSize, height: 1.25),
        ),
        const SizedBox(height: AppDimensions.spaceSM + 2),

        Text(
          service.description,
          style: AppTextStyle.withColor(
            AppTextStyle.bodyMedium,
            AppColors.textTertiary,
          ).copyWith(fontSize: bodyFontSize, height: 1.65),
        ),
        const SizedBox(height: AppDimensions.serviceCardFeatureGap),

        // Hairline rule separating the pitch from the deliverables.
        AnimatedContainer(
          duration: AppDurations.fast,
          height: AppDimensions.borderThin,
          color: AppColors.divider.withValues(alpha: isHovered ? 1.0 : 0.6),
        ),
        const SizedBox(height: AppDimensions.serviceCardFeatureGap),

        for (var i = 0; i < service.features.length; i++) ...[
          if (i > 0) const SizedBox(height: AppDimensions.serviceFeatureRowGap),
          ServiceFeatureRow(
            label: service.features[i],
            isCardHovered: isHovered,
            fontSize: featureFontSize,
          ),
        ],
      ],
    );
  }
}

/// The rounded, tinted square holding the service glyph.
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
        borderRadius: BorderRadius.circular(AppDimensions.radiusLG),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
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
                  color: AppColors.glow.withValues(alpha: 0.55),
                  blurRadius: 20,
                  offset: const Offset(0, 6),
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

/// The oversized, very faint "01" sitting opposite the glyph. It is decoration
/// rather than content, so it stays well below body-text contrast even lit.
class _IndexWatermark extends StatelessWidget {
  const _IndexWatermark({
    required this.label,
    required this.isHovered,
    required this.fontSize,
  });

  final String label;
  final bool isHovered;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return AnimatedDefaultTextStyle(
      duration: AppDurations.fast,
      curve: Curves.easeOut,
      style: AppTextStyle.h1.copyWith(
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
        height: 1.0,
        letterSpacing: -1,
        color: isHovered
            ? AppColors.primaryLight.withValues(alpha: 0.35)
            : AppColors.borderLight.withValues(alpha: 0.35),
      ),
      child: Text(label),
    );
  }
}

/// The accent rail that sweeps left-to-right across the card's top edge while
/// the card is hovered.
class _AccentRail extends StatelessWidget {
  const _AccentRail({required this.isHovered});

  final bool isHovered;

  @override
  Widget build(BuildContext context) {
    return AnimatedFractionallySizedBox(
      duration: AppDurations.medium,
      curve: Curves.easeOutCubic,
      alignment: Alignment.centerLeft,
      // Only the width animates — leaving [heightFactor] null lets the rail
      // keep its own 3px height against the Stack's unbounded vertical slot.
      widthFactor: isHovered ? 1.0 : 0.0,
      child: Container(
        height: AppDimensions.serviceCardAccentBarHeight,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primary, AppColors.accentGlow],
          ),
        ),
      ),
    );
  }
}
