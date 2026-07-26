import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import '../../utils/app_dimensions.dart';

/// A floating "back to top" pill that fades in once the page has been scrolled
/// past [revealOffset], and animates the attached [controller] back to the top
/// when tapped.
///
/// Shared by the desktop, tablet and mobile home screens; only the size,
/// glyph size and corner inset differ per breakpoint.
class ScrollToTopButton extends StatefulWidget {
  const ScrollToTopButton({
    super.key,
    required this.controller,
    this.size = AppDimensions.scrollTopButtonSize,
    this.iconSize = AppDimensions.scrollTopIconSize,
    this.inset = AppDimensions.scrollTopButtonInset,
    this.revealOffset = AppDimensions.scrollTopRevealOffset,
  });

  /// The scroll view this button drives. Must be the controller attached to the
  /// page's [ScrollView].
  final ScrollController controller;

  /// Diameter of the circular button.
  final double size;

  /// Size of the arrow glyph.
  final double iconSize;

  /// Distance from the bottom and right edges of the viewport.
  final double inset;

  /// Scroll distance after which the button becomes visible.
  final double revealOffset;

  @override
  State<ScrollToTopButton> createState() => _ScrollToTopButtonState();
}

class _ScrollToTopButtonState extends State<ScrollToTopButton> {
  bool _isVisible = false;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onScroll);
  }

  @override
  void didUpdateWidget(covariant ScrollToTopButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      oldWidget.controller.removeListener(_onScroll);
      widget.controller.addListener(_onScroll);
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    if (!widget.controller.hasClients) return;
    final bool shouldShow = widget.controller.offset > widget.revealOffset;
    if (shouldShow != _isVisible) {
      setState(() => _isVisible = shouldShow);
    }
  }

  void _scrollToTop() {
    if (!widget.controller.hasClients) return;
    widget.controller.animateTo(
      0,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final double lift = _isHovered ? -AppDimensions.scrollTopHoverLift : 0;
    // The button is a direct child of the page Stack (outside the SafeArea), so
    // it has to clear the system inset itself — otherwise it sits under the
    // home indicator on gesture-nav phones.
    final EdgeInsets viewPadding = MediaQuery.viewPaddingOf(context);

    return Positioned(
      right: widget.inset + viewPadding.right,
      bottom: widget.inset + viewPadding.bottom,
      child: IgnorePointer(
        ignoring: !_isVisible,
        // Slides up into place as it fades in, so it reads as arriving with the
        // scroll rather than blinking on.
        child: AnimatedSlide(
          offset: _isVisible ? Offset.zero : const Offset(0, 0.4),
          duration: const Duration(milliseconds: 260),
          curve: Curves.easeOutCubic,
          child: AnimatedOpacity(
            opacity: _isVisible ? 1 : 0,
            duration: const Duration(milliseconds: 260),
            curve: Curves.easeOut,
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              onEnter: (_) => setState(() => _isHovered = true),
              onExit: (_) => setState(() => _isHovered = false),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                curve: Curves.easeOut,
                transform: Matrix4.translationValues(0, lift, 0),
                width: widget.size,
                height: widget.size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: _isHovered
                        ? const [AppColors.primaryLight, AppColors.accent]
                        : const [AppColors.primary, AppColors.primaryLight],
                  ),
                  border: Border.all(
                    color: AppColors.accentGlow.withValues(
                      alpha: _isHovered ? 0.55 : 0.25,
                    ),
                    width: AppDimensions.borderThin,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.glow.withValues(
                        alpha: _isHovered ? 0.85 : 0.5,
                      ),
                      blurRadius: _isHovered ? 26 : 18,
                      spreadRadius: _isHovered ? 1 : 0,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  shape: const CircleBorder(),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: _scrollToTop,
                    customBorder: const CircleBorder(),
                    hoverColor: Colors.white.withValues(alpha: 0.06),
                    splashColor: Colors.white.withValues(alpha: 0.12),
                    child: Tooltip(
                      message: 'Back to top',
                      child: Icon(
                        Icons.keyboard_arrow_up_rounded,
                        size: widget.iconSize,
                        color: AppColors.buttonText,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
