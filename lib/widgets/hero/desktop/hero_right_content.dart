import 'package:flutter/material.dart';

import '../../../utils/app_dimensions.dart';
import '../../../utils/app_durations.dart';
import '../../common/fade_slide_in.dart';
import '../../common/floating.dart';
import 'availability_badge.dart';
import 'profile_avatar.dart';

/// The visual right column of the hero: the floating, glowing profile portrait
/// with the availability badge floating over its lower edge.
///
/// Extra padding surrounds the avatar so its outer glow and the floating badge
/// have room to breathe without being clipped.
class HeroRightContent extends StatelessWidget {
  const HeroRightContent({
    super.key,
    this.image,
    this.size = AppDimensions.profileImageSize,
  });

  final double size;

  /// Optional portrait passed straight through to [ProfileAvatar].
  final ImageProvider? image;

  @override
  Widget build(BuildContext context) {
    return FadeSlideIn(
      delay: AppDurations.stagger * 3,
      offset: const Offset(40, 0),
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.space3XL),
        child: Floating(
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              ProfileAvatar(image: image, size: size),
              // Availability badge, floating slightly out of sync near the
              // bottom of the portrait.
              Positioned(
                bottom: AppDimensions.spaceXL,
                right: -AppDimensions.spaceXL,
                child: Floating(
                  amplitude: 8,
                  phaseOffset: 0.5,
                  child: const AvailabilityBadge(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
