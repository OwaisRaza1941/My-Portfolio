import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import '../../utils/app_dimensions.dart';
import '../../utils/text_style.dart';

/// A reusable section header: a small colored eyebrow label above a large
/// heading, optionally with a supporting subtitle.
///
/// Used to introduce each major section of the portfolio with a consistent
/// rhythm. Lives here in `common/` because every section shares this shape.
class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.eyebrow,
    required this.title,
    this.subtitle,
    this.alignment = CrossAxisAlignment.start,
  });

  /// Small accent label (e.g. "WHAT I DO").
  final String eyebrow;

  /// Main heading text.
  final String title;

  /// Optional supporting line beneath the heading.
  final String? subtitle;

  final CrossAxisAlignment alignment;

  @override
  Widget build(BuildContext context) {
    final textAlign = alignment == CrossAxisAlignment.center
        ? TextAlign.center
        : TextAlign.start;

    return Column(
      crossAxisAlignment: alignment,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          eyebrow.toUpperCase(),
          textAlign: textAlign,
          style: AppTextStyle.labelMedium.copyWith(
            color: AppColors.primaryLight,
            letterSpacing: 3,
          ),
        ),
        const SizedBox(height: AppDimensions.spaceSM),
        Text(
          title,
          textAlign: textAlign,
          style: AppTextStyle.withColor(AppTextStyle.h2, AppColors.textPrimary),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: AppDimensions.spaceMD),
          Text(
            subtitle!,
            textAlign: textAlign,
            style: AppTextStyle.withColor(
              AppTextStyle.bodyLarge,
              AppColors.textSecondary,
            ),
          ),
        ],
      ],
    );
  }
}
