import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../utils/app_color.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/app_durations.dart';
import '../../common/hover_builder.dart';

/// Opens [images] full-screen over a progressively blurred, dimmed backdrop —
/// the project grid's "tap to zoom" affordance. A single-image list behaves
/// exactly as before; a longer list adds swipe navigation and dot
/// indicators. The same route opens from a mouse click or a touch tap, and
/// closes on a tap anywhere outside the image or on the close button.
Future<void> showProjectImageZoom(
  BuildContext context, {
  required List<String> images,
}) {
  return Navigator.of(context).push(
    PageRouteBuilder<void>(
      opaque: false,
      barrierColor: Colors.transparent,
      transitionDuration: AppDurations.medium,
      reverseTransitionDuration: AppDurations.fast,
      pageBuilder: (context, animation, secondaryAnimation) {
        return _ProjectZoomView(images: images, animation: animation);
      },
    ),
  );
}

/// Full-screen overlay: a blurred, dimmed backdrop behind a scaled-in,
/// swipeable copy of the tapped project's screenshots. Both the blur
/// strength and the image scale track the same route animation, so opening
/// and closing read as one motion.
class _ProjectZoomView extends StatefulWidget {
  const _ProjectZoomView({required this.images, required this.animation});

  final List<String> images;
  final Animation<double> animation;

  @override
  State<_ProjectZoomView> createState() => _ProjectZoomViewState();
}

class _ProjectZoomViewState extends State<_ProjectZoomView> {
  late final PageController _pageController = PageController();
  int _index = 0;

  void _goTo(int index) {
    final clamped = index.clamp(0, widget.images.length - 1);
    _pageController.animateToPage(
      clamped,
      duration: AppDurations.fast,
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final curved = CurvedAnimation(
      parent: widget.animation,
      curve: Curves.easeOutCubic,
    );
    final hasMultiple = widget.images.length > 1;

    final gallery = Padding(
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
          child: Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(
                  AppDimensions.projectZoomRadius,
                ),
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: widget.images.length,
                  onPageChanged: (index) => setState(() => _index = index),
                  itemBuilder: (context, index) => InteractiveViewer(
                    maxScale: 4,
                    child: Image.asset(
                      widget.images[index],
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
              if (hasMultiple) ...[
                Positioned(
                  left: AppDimensions.spaceSM,
                  child: _NavArrowButton(
                    icon: Icons.chevron_left_rounded,
                    onTap: () => _goTo(_index - 1),
                  ),
                ),
                Positioned(
                  right: AppDimensions.spaceSM,
                  child: _NavArrowButton(
                    icon: Icons.chevron_right_rounded,
                    onTap: () => _goTo(_index + 1),
                  ),
                ),
                Positioned(
                  bottom: AppDimensions.spaceMD,
                  child: _DotIndicators(
                    count: widget.images.length,
                    activeIndex: _index,
                  ),
                ),
              ],
            ],
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
      child: gallery,
    );
  }
}

/// A round prev/next arrow floating over the zoomed image's edge.
class _NavArrowButton extends StatelessWidget {
  const _NavArrowButton({required this.icon, required this.onTap});

  final IconData icon;
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
          child: Icon(icon, color: AppColors.textPrimary, size: 26),
        );
      },
    );
  }
}

/// The small row of dots under the gallery marking the current screenshot.
class _DotIndicators extends StatelessWidget {
  const _DotIndicators({required this.count, required this.activeIndex});

  final int count;
  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var i = 0; i < count; i++)
          AnimatedContainer(
            duration: AppDurations.fast,
            curve: Curves.easeOut,
            margin: const EdgeInsets.symmetric(
              horizontal: AppDimensions.spaceXS / 2,
            ),
            width: i == activeIndex ? 20 : 8,
            height: 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimensions.radiusPill),
              color: i == activeIndex
                  ? AppColors.primary
                  : AppColors.textDisabled.withValues(alpha: 0.6),
            ),
          ),
      ],
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
