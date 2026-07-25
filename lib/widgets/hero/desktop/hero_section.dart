import 'package:flutter/material.dart';

import '../../../utils/app_dimensions.dart';
import 'hero_left_content.dart';
import 'hero_right_content.dart';

/// The full desktop hero: text content on the left, floating profile visual on
/// the right, laid out in a centered, width-constrained row.
///
/// This widget is purely presentational — all actions are delegated up through
/// callbacks so the owning screen controls navigation, downloads, and links.
class HeroSection extends StatelessWidget {
  const HeroSection({
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
          maxWidth: AppDimensions.maxContentWidth,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.pageHorizontalPadding,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Text column takes the available space...
              Expanded(
                flex: 6,
                child: HeroLeftContent(
                  onHireMe: onHireMe,
                  onDownloadCv: onDownloadCv,
                  onOpenSocial: onOpenSocial,
                ),
              ),
              const SizedBox(width: AppDimensions.heroColumnGap),
              // ...visual column sizes to the portrait.
              Expanded(
                flex: 5,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: HeroRightContent(image: profileImage),
                ),
              ),
            ],
          ),
        ),
      ),
    );


  }
}
