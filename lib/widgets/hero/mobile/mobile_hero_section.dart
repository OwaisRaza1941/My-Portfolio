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

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 500,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            // vertical: 24,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}