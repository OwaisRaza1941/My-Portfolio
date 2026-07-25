import 'package:flutter/material.dart';

import '../../../models/about_stat.dart';
import '../../../utils/app_color.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/app_strings.dart';
import '../../../utils/text_style.dart';
import '../../common/gradient_text.dart';

/// The headline-numbers strip: three gradient figures with muted captions,
/// separated by thin vertical rules.
///
/// It sits between the highlight grid and the call-to-action so the section ends
/// on something concrete.
class AboutStats extends StatelessWidget {
  const AboutStats({super.key, this.valueFontSize});

  /// Override for the large figure size, so compact layouts can scale down.
  final double? valueFontSize;

  static const List<AboutStat> _stats = [
    AboutStat(
      value: AppStrings.aboutStatExperienceValue,
      label: AppStrings.aboutStatExperienceLabel,
    ),
    AboutStat(
      value: AppStrings.aboutStatProjectsValue,
      label: AppStrings.aboutStatProjectsLabel,
    ),
    AboutStat(
      value: AppStrings.aboutStatCommitmentValue,
      label: AppStrings.aboutStatCommitmentLabel,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (var i = 0; i < _stats.length; i++) ...[
            if (i > 0) const _StatDivider(),
            Flexible(
              child: _StatTile(
                stat: _stats[i],
                valueFontSize: valueFontSize,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _StatTile extends StatelessWidget {
  const _StatTile({required this.stat, this.valueFontSize});

  final AboutStat stat;
  final double? valueFontSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GradientText(
          stat.value,
          gradient: const LinearGradient(
            colors: [AppColors.accentGlow, AppColors.primaryLight],
          ),
          style: AppTextStyle.h1.copyWith(
            fontSize: valueFontSize ?? AppDimensions.aboutStatValueFontSize,
            fontWeight: FontWeight.w700,
            height: 1.1,
          ),
        ),
        const SizedBox(height: AppDimensions.spaceXS),
        Text(
          stat.label,
          style: AppTextStyle.withColor(
            AppTextStyle.bodySmall,
            AppColors.textTertiary,
          ).copyWith(fontSize: AppDimensions.aboutStatLabelFontSize),
        ),
      ],
    );
  }
}

/// A thin vertical rule that fades out at both ends.
class _StatDivider extends StatelessWidget {
  const _StatDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.borderThin,
      height: AppDimensions.aboutStatDividerHeight,
      margin: const EdgeInsets.symmetric(
        horizontal: AppDimensions.aboutStatGap,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.divider.withValues(alpha: 0),
            AppColors.borderLight,
            AppColors.divider.withValues(alpha: 0),
          ],
        ),
      ),
    );
  }
}
