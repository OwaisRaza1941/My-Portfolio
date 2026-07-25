import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import '../../utils/app_dimensions.dart';

/// A small block caret that fades in and out on a loop, the way a text cursor
/// blinks in an editor.
///
/// Used at the end of the about-section snippet so the code window reads as a
/// live editor rather than a static image — a lot of perceived life for one
/// cheap animation.
class BlinkingCaret extends StatefulWidget {
  const BlinkingCaret({
    super.key,
    this.width = AppDimensions.aboutCaretWidth,
    this.height = AppDimensions.aboutCaretHeight,
    this.color = AppColors.primaryLight,
    this.period = const Duration(milliseconds: 1100),
  });

  final double width;
  final double height;
  final Color color;

  /// Time for one full on/off cycle.
  final Duration period;

  @override
  State<BlinkingCaret> createState() => _BlinkingCaretState();
}

class _BlinkingCaretState extends State<BlinkingCaret>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.period)
      ..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      // Never fully transparent — the caret pulses rather than disappearing,
      // which is calmer next to a block of static text.
      opacity: Tween<double>(begin: 0.15, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
      ),
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(AppDimensions.spaceXS / 2),
          boxShadow: [
            BoxShadow(
              color: widget.color.withValues(alpha: 0.6),
              blurRadius: 8,
            ),
          ],
        ),
      ),
    );
  }
}
