import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../utils/app_color.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/app_durations.dart';
import '../../common/hover_builder.dart';

/// Opens [imageAsset] full-screen over a progressively blurred, dimmed
/// backdrop — the project grid's "tap to zoom" affordance. The same route
/// opens from a mouse click or a touch tap, and closes on a tap anywhere
/// outside the image or on the close button.
Future<void> showProjectImageZoom(
  BuildContext context, {
  required String imageAsset,
}) {
  return Navigator.of(context).push(
    PageRouteBuilder<void>(
      opaque: false,
      barrierColor: Colors.transparent,
      transitionDuration: AppDurations.medium,
      reverseTransitionDuration: AppDurations.fast,
      pageBuilder: (context, animation, secondaryAnimation) {
        return _ProjectZoomView(imageAsset: imageAsset, animation: animation);
      },
    ),
  );
}

/// Full-screen overlay: a blurred, dimmed backdrop behind a scaled-in copy of
/// the tapped screenshot. Both the blur strength and the image scale track
/// the same route animation, so opening and closing read as one motion.
class _ProjectZoomView extends StatelessWidget {
  const _ProjectZoomView({required this.imageAsset, required this.animation});

  final String imageAsset;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    final curved = CurvedAnimation(
      parent: animation,
      curve: Curves.easeOutCubic,
    );

    final image = Padding(
      padding: const EdgeInsets.all(AppDimensions.projectZoomPadding),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: AppDimensions.projectZoomMaxWidth,
          maxHeight:
              MediaQuery.sizeOf(context).height *
              AppDimensions.projectZoomMaxHeightFraction,
        ),
        // Swallows taps so tapping the image itself doesn't close the view.
        child: GestureDetector(
          onTap: () {},
          child: ClipRRect(
            borderRadius: BorderRadius.circular(
              AppDimensions.projectZoomRadius,
            ),
            child: InteractiveViewer(
              maxScale: 4,
              child: Image.asset(
                imageAsset,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 420,
                  height: 300,
                  color: AppColors.surface,
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.image_outlined,
                    color: AppColors.textDisabled,
                    size: 48,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    return AnimatedBuilder(
      animation: curved,
      builder: (context, child) {
        final t = curved.value;
        return Stack(
          children: [
            Positioned.fill(
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: AppDimensions.projectZoomBlurSigma * t,
                    sigmaY: AppDimensions.projectZoomBlurSigma * t,
                  ),
                  child: Container(
                    color: Colors.black.withValues(alpha: 0.78 * t),
                  ),
                ),
              ),
            ),
            Center(
              child: Opacity(
                opacity: t,
                child: Transform.scale(scale: 0.88 + 0.12 * t, child: child),
              ),
            ),
            Positioned(
              top: AppDimensions.spaceLG,
              right: AppDimensions.spaceLG,
              child: Opacity(
                opacity: t,
                child: _CloseButton(
                  onTap: () => Navigator.of(context).pop(),
                ),
              ),
            ),
          ],
        );
      },
      child: image,
    );
  }
}

/// The circular dismiss button in the corner of the zoom view.
class _CloseButton extends StatelessWidget {
  const _CloseButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return HoverBuilder(
      onTap: onTap,
      builder: (context, isHovered) {
        return AnimatedContainer(
          duration: AppDurations.fast,
          curve: Curves.easeOut,
          width: AppDimensions.projectZoomCloseButtonSize,
          height: AppDimensions.projectZoomCloseButtonSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isHovered
                ? AppColors.primary.withValues(alpha: 0.9)
                : AppColors.card.withValues(alpha: 0.85),
            border: Border.all(
              color: AppColors.border.withValues(alpha: 0.9),
              width: AppDimensions.borderThin,
            ),
          ),
          child: const Icon(
            Icons.close_rounded,
            color: AppColors.textPrimary,
            size: 22,
          ),
        );
      },
    );
  }
}
