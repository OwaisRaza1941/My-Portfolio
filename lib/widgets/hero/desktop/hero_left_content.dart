import 'package:flutter/material.dart';

import '../../../utils/app_color.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/app_durations.dart';
import '../../../utils/app_strings.dart';
import '../../../utils/text_style.dart';
import '../../buttons/primary_button.dart';
import '../../buttons/secondary_button.dart';
import '../../common/fade_slide_in.dart';
import '../../common/gradient_text.dart';
import 'hero_badge.dart';
import 'social_icons.dart';

/// The textual left column of the hero: status badge, greeting, animated name
/// and role headline, description, primary actions, and social links.
///
/// Every block fades and slides in with a staggered delay so the content
/// assembles itself elegantly on load.
class HeroLeftContent extends StatelessWidget {
  const HeroLeftContent({
    super.key,
    required this.onHireMe,
    required this.onDownloadCv,
    required this.onOpenSocial,
  });

  final VoidCallback onHireMe;
  final VoidCallback onDownloadCv;
  final ValueChanged<String> onOpenSocial;

  // Hero-specific display sizes, derived from the base heading styles so the
  // typography scale stays centralized (no loose magic numbers in the tree).
  static const double _nameFontSize = 66;
  static const double _roleFontSize = 34;
  static const double _headlineFontSize = 26;

  /// Delay helper so the stagger reads as a clean, evenly spaced cascade.
  Duration _delay(int step) => AppDurations.stagger * step;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: AppDimensions.heroLeftMaxWidth,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeSlideIn(
            delay: _delay(0),
            child: const HeroBadge(label: AppStrings.heroBadge),
          ),
          const SizedBox(height: AppDimensions.spaceXL),

          // Greeting.
          FadeSlideIn(
            delay: _delay(1),
            child: Text(
              AppStrings.heroGreeting,
              style: AppTextStyle.withColor(
                AppTextStyle.h3,
                AppColors.textSecondary,
              ).copyWith(fontWeight: FontWeight.w400),
            ),
          ),
          const SizedBox(height: AppDimensions.spaceSM),

          // Name — the largest, gradient-filled element.
          FadeSlideIn(
            delay: _delay(2),
            child: GradientText(
              AppStrings.fullName,
              style: AppTextStyle.h1.copyWith(
                fontSize: _nameFontSize,
                fontWeight: FontWeight.w700,
                height: 1.05,
              ),
            ),
          ),
          const SizedBox(height: AppDimensions.spaceSM),

          // Role line, tinted with the accent gradient.
          FadeSlideIn(
            delay: _delay(3),
            child: GradientText(
              AppStrings.heroRoleLine,
              gradient: const LinearGradient(
                colors: [AppColors.primaryLight, AppColors.accent],
              ),
              style: AppTextStyle.h1.copyWith(
                fontSize: _roleFontSize,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: AppDimensions.spaceMD),

          // Supporting headline.
          FadeSlideIn(
            delay: _delay(4),
            child: Text(
              AppStrings.heroHeadline,
              style: AppTextStyle.h2.copyWith(
                fontSize: _headlineFontSize,
                color: AppColors.textPrimary,
                height: 1.25,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: AppDimensions.spaceLG),

          // Description paragraph.
          FadeSlideIn(
            delay: _delay(5),
            child: Text(
              AppStrings.heroDescription,
              style: AppTextStyle.withColor(
                AppTextStyle.bodyLarge,
                AppColors.textTertiary,
              ).copyWith(height: 1.7),
            ),
          ),
          const SizedBox(height: AppDimensions.space2XL),

          // Primary actions.
          FadeSlideIn(
            delay: _delay(6),
            child: Row(
              children: [
                PrimaryButton(
                  label: AppStrings.hireMe,
                  onPressed: onHireMe,
                ),
                const SizedBox(width: AppDimensions.spaceMD),
                SecondaryButton(
                  label: AppStrings.downloadCv,
                  icon: Icons.file_download_outlined,
                  onPressed: onDownloadCv,
                ),
              ],
            ),
          ),
          const SizedBox(height: AppDimensions.space2XL),

          // Social links.
          FadeSlideIn(
            delay: _delay(7),
            child: SocialIcons(onOpen: onOpenSocial),
          ),
        ],
      ),
    );
  }
}
