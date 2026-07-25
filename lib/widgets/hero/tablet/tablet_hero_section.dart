import 'package:flutter/material.dart';

import '../../../utils/app_dimensions.dart';
import '../desktop/hero_left_content.dart';
import '../desktop/hero_right_content.dart';

/// The hero as it reads on tablets: the same two-column layout as desktop, but
/// on the tablet measure — narrower content cap, tighter gutters, a stepped
/// down type scale, and a smaller portrait.
///
/// Reusing the desktop columns keeps the content in one place; only the sizing
/// is overridden here.
class TabletHeroSection extends StatelessWidget {
  const TabletHeroSection({
    super.key,
    required this.onHireMe,
    required this.onDownloadCv,
    required this.onOpenSocial,
    this.profileImage,
  });

  final VoidCallback onHireMe;
  final VoidCallback onDownloadCv;
  final ValueChanged<String> onOpenSocial;

  /// Optional portrait forwarded to the right-side avatar.
  final ImageProvider? profileImage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: AppDimensions.tabletMaxContentWidth,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.tabletHorizontalPadding,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 6,
                child: HeroLeftContent(
                  onHireMe: onHireMe,
                  onDownloadCv: onDownloadCv,
                  onOpenSocial: onOpenSocial,
                  maxWidth: AppDimensions.tabletHeroLeftMaxWidth,
                  nameFontSize: AppDimensions.tabletHeroNameFontSize,
                  roleFontSize: AppDimensions.tabletHeroRoleFontSize,
                  headlineFontSize: AppDimensions.tabletHeroHeadlineFontSize,
                  greetingFontSize: AppDimensions.tabletHeroGreetingFontSize,
                  descriptionFontSize:
                      AppDimensions.tabletHeroDescriptionFontSize,
                  buttonHeight: AppDimensions.tabletButtonHeight,
                  buttonHorizontalPadding:
                      AppDimensions.tabletButtonHorizontalPadding,
                  buttonFontSize: AppDimensions.tabletButtonFontSize,
                  buttonIconSize: AppDimensions.tabletButtonIconSize,
                ),
              ),
              const SizedBox(width: AppDimensions.tabletHeroColumnGap),
              Expanded(
                flex: 5,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: HeroRightContent(
                    image: profileImage,
                    size: AppDimensions.tabletProfileImageSize,
                    padding: AppDimensions.tabletProfilePadding,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
