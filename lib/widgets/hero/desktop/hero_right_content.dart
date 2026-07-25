import 'dart:math' as math;

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
    this.padding = AppDimensions.space3XL,
  });

  /// Preferred diameter of the portrait. Treated as a maximum — if the column
  /// is narrower, the avatar shrinks with it so it always stays a true circle.
  final double size;

  /// Breathing room around the avatar, reserved for its glow and the badge.
  final double padding;

  /// Optional portrait passed straight through to [ProfileAvatar].
  final ImageProvider? image;

  @override
  Widget build(BuildContext context) {
    return FadeSlideIn(
      delay: AppDurations.stagger * 3,
      offset: const Offset(40, 0),
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: LayoutBuilder(
          builder: (context, constraints) {
            // A fixed-diameter avatar in a narrower column would be squeezed on
            // the width axis only, turning the circle into an ellipse. Resolve
            // the diameter against the space we actually have instead.
            final available = constraints.maxWidth;
            final diameter = available.isFinite
                ? math.max(0.0, math.min(size, available))
                : size;

            return Floating(
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  ProfileAvatar(image: image, size: diameter),
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
            );
          },
        ),
      ),
    );
  }
}
