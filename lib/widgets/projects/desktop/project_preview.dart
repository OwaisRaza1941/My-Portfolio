import 'package:flutter/material.dart';

import '../../../utils/app_color.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/app_durations.dart';

/// The app screenshot presented inside a dark phone frame, with a soft blue
/// bloom behind it.
///
/// The captures are all portrait phone screens of the same shape, so the frame
/// pins one aspect ratio ([AppDimensions.projectPreviewAspectRatio]) and every
/// project sits at exactly the same size down the page.
///
/// It has no hover state of its own — [isHovered] comes from the showcase row
/// around it, so the frame and the copy beside it react to the pointer as one
/// surface.
class ProjectPreview extends StatelessWidget {
  const ProjectPreview({
    super.key,
    required this.imageAsset,
    this.isHovered = false,
    this.width = AppDimensions.projectPreviewWidth,
  });

  final String imageAsset;

  /// Whether the showcase row around this preview is hovered.
  final bool isHovered;

  final double width;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: AppDurations.medium,
      curve: Curves.easeOut,
      width: width,
      transform: Matrix4.translationValues(
        0,
        isHovered ? -AppDimensions.projectPreviewHoverLift : 0,
        0,
      ),
      padding: const EdgeInsets.all(AppDimensions.projectPreviewBezel),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          AppDimensions.projectPreviewFrameRadius,
        ),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.cardHover, AppColors.scaffoldBackground],
        ),
        border: Border.all(
          color: isHovered
              ? AppColors.primary.withValues(alpha: 0.75)
              : AppColors.border,
          width: AppDimensions.borderThick,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.glow.withValues(alpha: isHovered ? 0.45 : 0.20),
            blurRadius: isHovered ? 48 : 28,
            spreadRadius: isHovered ? 2 : 0,
            offset: const Offset(0, 18),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          AppDimensions.projectPreviewFrameRadius -
              AppDimensions.projectPreviewBezel,
        ),
        child: AspectRatio(
          aspectRatio: AppDimensions.projectPreviewAspectRatio,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                imageAsset,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
                filterQuality: FilterQuality.medium,
                // A screenshot that fails to decode must not take the row down
                // with it — fall back to the empty frame.
                errorBuilder: (context, error, stackTrace) =>
                    const ColoredBox(color: AppColors.surface),
              ),

              // Very light blue wash so the screenshot sits in the page's
              // palette instead of glowing white against the dark background.
              // It clears on hover, handing the screenshot its true colors.
              AnimatedContainer(
                duration: AppDurations.medium,
                curve: Curves.easeOut,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.primary.withValues(
                        alpha: isHovered ? 0.0 : 0.06,
                      ),
                      AppColors.scaffoldBackground.withValues(
                        alpha: isHovered ? 0.0 : 0.22,
                      ),
                    ],
                  ),
                ),
              ),

              const Align(
                alignment: Alignment.topCenter,
                child: _FrameNotch(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// The small speaker pill hanging from the top edge of the frame, which is what
/// makes the plain rounded rectangle read as a phone.
class _FrameNotch extends StatelessWidget {
  const _FrameNotch();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.projectPreviewNotchWidth,
      height: AppDimensions.projectPreviewNotchHeight,
      decoration: const BoxDecoration(
        color: AppColors.scaffoldBackground,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(AppDimensions.radiusMD),
        ),
      ),
      child: Center(
        child: Container(
          width: AppDimensions.spaceXL,
          height: AppDimensions.spaceXS,
          decoration: BoxDecoration(
            color: AppColors.borderLight,
            borderRadius: BorderRadius.circular(AppDimensions.radiusPill),
          ),
        ),
      ),
    );
  }
}
