import 'package:flutter/material.dart';

import '../../../utils/app_color.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/app_durations.dart';
import '../../../utils/app_strings.dart';
import '../../../utils/text_style.dart';
import '../../common/fade_slide_in.dart';
import '../../common/gradient_text.dart';
import '../../common/heading_underline.dart';
import '../../common/section_badge.dart';

/// The centered header of the skills section: the "⚡ MY SKILLS" eyebrow pill,
/// the gradient heading with its accent underline, and a one-sentence summary.
///
/// Mirrors the about header exactly, so both sections open with the same gesture
/// as the page scrolls.
class SkillsHeader extends StatelessWidget {
  const SkillsHeader({
    super.key,
    this.titleFontSize = AppDimensions.aboutTitleFontSize,
    this.subtitleFontSize = AppDimensions.aboutSubtitleFontSize,
    this.maxWidth = AppDimensions.skillsHeaderMaxWidth,
  });

  /// Typography overrides so smaller layouts can reuse this header verbatim.
  final double titleFontSize;
  final double subtitleFontSize;

  /// Width cap for the heading and subtitle block.
  final double maxWidth;

  Duration _delay(int step) => AppDurations.stagger * step;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FadeSlideIn(
          delay: _delay(0),
          child: const SectionBadge(
            emoji: AppStrings.skillsBadgeEmoji,
            label: AppStrings.skillsBadge,
          ),
        ),
        const SizedBox(height: AppDimensions.spaceLG),

        // Main heading.
        FadeSlideIn(
          delay: _delay(1),
          child: GradientText(
            AppStrings.skillsTitle,
            textAlign: TextAlign.center,
            style: AppTextStyle.h1.copyWith(
              fontSize: titleFontSize,
              fontWeight: FontWeight.w700,
              height: 1.15,
            ),
          ),
        ),
        const SizedBox(height: AppDimensions.spaceMD),

        FadeSlideIn(delay: _delay(2), child: const HeadingUnderline()),
        const SizedBox(height: AppDimensions.spaceLG),

        // Supporting summary.
        FadeSlideIn(
          delay: _delay(3),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxWidth),
            child: Text(
              AppStrings.skillsSubtitle,
              textAlign: TextAlign.center,
              style: AppTextStyle.withColor(
                AppTextStyle.bodyLarge,
                AppColors.textTertiary,
              ).copyWith(height: 1.7, fontSize: subtitleFontSize),
            ),
          ),
        ),
      ],
    );
  }
}
