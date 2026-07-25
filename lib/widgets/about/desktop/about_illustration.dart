import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../models/tech_badge.dart';
import '../../../utils/app_color.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/app_durations.dart';
import '../../../utils/app_strings.dart';
import '../../common/fade_slide_in.dart';
import '../../common/floating.dart';
import 'code_window.dart';
import 'tech_badge_pill.dart';

/// The left column of the about section: the floating code-window illustration
/// with stack badges drifting around its edges and a soft halo behind it.
///
/// The whole group slides in from the left on first paint and then floats
/// gently, mirroring the hero portrait's motion so the two sections feel like
/// one continuous design.
class AboutIllustration extends StatelessWidget {
  const AboutIllustration({
    super.key,
    this.maxWidth = AppDimensions.aboutIllustrationMaxWidth,
    this.padding = AppDimensions.aboutIllustrationPadding,
    this.codeFontSize,
    this.codePadding = AppDimensions.aboutCodeWindowPadding,
    this.codeLineHeight = AppDimensions.aboutCodeLineHeight,
    this.codeGutterWidth = AppDimensions.aboutCodeGutterWidth,
    this.codeGutterGap = AppDimensions.spaceMD,
  });

  /// Preferred width of the window. Treated as a maximum — a narrower column
  /// shrinks the window instead of overflowing it.
  final double maxWidth;

  /// Breathing room around the window, reserved for its halo and the badges
  /// that overhang its edges.
  final double padding;

  /// Forwarded to [CodeWindow] so compact layouts can shrink the snippet, tuck
  /// its padding in, and tighten the line rhythm to match.
  final double? codeFontSize;
  final double codePadding;
  final double codeLineHeight;
  final double codeGutterWidth;
  final double codeGutterGap;

  /// The stack badges, with the corner each one hangs off.
  static const List<_PositionedBadge> _badges = [
    _PositionedBadge(
      badge: TechBadge(
        label: AppStrings.aboutTechFlutter,
        icon: FontAwesomeIcons.flutter,
        color: AppColors.flutterBrand,
      ),
      alignment: Alignment.topRight,
      offset: Offset(AppDimensions.aboutTechBadgeOverhang, -20),
      phaseOffset: 0,
    ),
    _PositionedBadge(
      badge: TechBadge(
        label: AppStrings.aboutTechDart,
        icon: FontAwesomeIcons.dartLang,
        color: AppColors.dartBrand,
      ),
      alignment: Alignment.centerLeft,
      offset: Offset(-AppDimensions.aboutTechBadgeOverhang, -30),
      phaseOffset: 0.35,
    ),
    _PositionedBadge(
      badge: TechBadge(
        label: AppStrings.aboutTechFirebase,
        icon: FontAwesomeIcons.fire,
        color: AppColors.firebaseBrand,
      ),
      alignment: Alignment.bottomRight,
      offset: Offset(AppDimensions.aboutTechBadgeOverhang - 8, 18),
      phaseOffset: 0.65,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return FadeSlideIn(
      delay: AppDurations.stagger * 4,
      offset: const Offset(-40, 0),
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Resolve the window width against the space we actually have, so
            // the illustration never forces the row wider than the page.
            final available = constraints.maxWidth;
            final width = available.isFinite
                ? math.max(0.0, math.min(maxWidth, available))
                : maxWidth;

            return SizedBox(
              width: width,
              child: Floating(
                amplitude: AppDimensions.spaceSM,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    // Halo behind the window, sized to it.
                    const Positioned.fill(child: _Halo()),
                    CodeWindow(
                      fontSize: codeFontSize,
                      padding: codePadding,
                      lineHeight: codeLineHeight,
                      gutterWidth: codeGutterWidth,
                      gutterGap: codeGutterGap,
                    ),
                    for (final entry in _badges)
                      Positioned.fill(
                        child: Align(
                          alignment: entry.alignment,
                          child: Transform.translate(
                            offset: entry.offset,
                            child: Floating(
                              amplitude: AppDimensions.spaceSM - 2,
                              phaseOffset: entry.phaseOffset,
                              child: TechBadgePill(badge: entry.badge),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

/// A badge plus where it sits relative to the code window.
@immutable
class _PositionedBadge {
  const _PositionedBadge({
    required this.badge,
    required this.alignment,
    required this.offset,
    required this.phaseOffset,
  });

  final TechBadge badge;

  /// Which edge of the window the badge anchors to.
  final Alignment alignment;

  /// Nudge applied after aligning, so the badge overhangs the window edge.
  final Offset offset;

  /// Float phase (0–1) so the badges bob out of sync with each other.
  final double phaseOffset;
}

/// A wide, soft blue-violet glow sitting behind the code window.
class _Halo extends StatelessWidget {
  const _Halo();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Transform.scale(
        scale: 1.25,
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [
                AppColors.primary.withValues(alpha: 0.28),
                AppColors.accent.withValues(alpha: 0.10),
                AppColors.primary.withValues(alpha: 0),
              ],
              stops: const [0.0, 0.5, 1.0],
            ),
          ),
        ),
      ),
    );
  }
}
