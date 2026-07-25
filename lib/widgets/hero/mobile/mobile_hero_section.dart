import 'package:flutter/material.dart';
import 'package:portfolio/utils/app_dimensions.dart';
import 'package:portfolio/widgets/hero/desktop/hero_left_content.dart';
import 'package:portfolio/widgets/hero/desktop/hero_right_content.dart';

class MobileHeroSection extends StatelessWidget {
  const MobileHeroSection({
    super.key,
    required this.onHireMe,
    required this.onDownloadCv,
    required this.onOpenSocial,
    this.profileImage,
  });

  final VoidCallback onHireMe;
  final VoidCallback onDownloadCv;
  final ValueChanged<String> onOpenSocial;
  final ImageProvider? profileImage;

  /// Width cap for the whole column so the hero stays readable on tablets held
  /// in the phone breakpoint and on large phones.
  static const double _maxWidth = 500;

  static const double _horizontalPadding = 15;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: _maxWidth,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: _horizontalPadding,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              HeroRightContent(
                image: profileImage,
                size: AppDimensions.mobileProfileImageSize,
              ),

              const SizedBox(
                height: AppDimensions.spaceXL,
              ),

              HeroLeftContent(
                onHireMe: onHireMe,
                onDownloadCv: onDownloadCv,
                onOpenSocial: onOpenSocial,
                maxWidth: _maxWidth,
                nameFontSize: AppDimensions.mobileHeroNameFontSize,
                roleFontSize: AppDimensions.mobileHeroRoleFontSize,
                headlineFontSize: AppDimensions.mobileHeroHeadlineFontSize,
                greetingFontSize: AppDimensions.mobileHeroGreetingFontSize,
                descriptionFontSize:
                    AppDimensions.mobileHeroDescriptionFontSize,
                buttonHeight: AppDimensions.mobileButtonHeight,
                buttonHorizontalPadding:
                    AppDimensions.mobileButtonHorizontalPadding,
                buttonFontSize: AppDimensions.mobileButtonFontSize,
                buttonIconSize: AppDimensions.mobileButtonIconSize,
              ),
            ],
          ),
        ),
      ),
    );
  }
}