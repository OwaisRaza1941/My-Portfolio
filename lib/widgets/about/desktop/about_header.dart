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

/// The centered header of the about section: the "👋 ABOUT ME" eyebrow pill, the
/// gradient "Who I Am & What I Do" heading with an accent underline, and the
/// supporting one-sentence summary.
///
/// Everything is center-aligned and width-capped so the paragraph wraps into a
/// balanced block instead of stretching the full content width.
class AboutHeader extends StatelessWidget {
  const AboutHeader({
    super.key,
    this.titleFontSize = AppDimensions.aboutTitleFontSize,
    this.subtitleFontSize = AppDimensions.aboutSubtitleFontSize,
    this.maxWidth = AppDimensions.aboutHeaderMaxWidth,
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
            emoji: AppStrings.aboutBadgeEmoji,
            label: AppStrings.aboutBadge,
          ),
        ),
        const SizedBox(height: AppDimensions.spaceLG),

        // Main heading.
        FadeSlideIn(
          delay: _delay(1),
          child: GradientText(
            AppStrings.aboutTitle,
            textAlign: TextAlign.center,
            style: AppTextStyle.h1.copyWith(
              fontSize: titleFontSize,
              fontWeight: FontWeight.w700,
              height: 1.15,
            ),
          ),
        ),
        const SizedBox(height: AppDimensions.spaceMD),

        // Short accent rule, tapering out at both ends.
        FadeSlideIn(delay: _delay(2), child: const HeadingUnderline()),
        const SizedBox(height: AppDimensions.spaceLG),

        // Supporting summary.
        FadeSlideIn(
          delay: _delay(3),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxWidth),
            child: Text(
              AppStrings.aboutSubtitle,
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
