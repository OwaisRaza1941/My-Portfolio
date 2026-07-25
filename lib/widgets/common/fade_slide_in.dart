import 'package:flutter/material.dart';

import '../../utils/app_durations.dart';

/// A reusable entrance animation that fades a child in while sliding it a short
/// distance into place. Used to give the hero content a smooth, staggered
/// "appear" effect on first paint.
///
/// The animation runs once when the widget is first mounted. Pass a [delay] to
/// stagger multiple elements.
class FadeSlideIn extends StatefulWidget {
  const FadeSlideIn({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.duration = AppDurations.slow,
    this.offset = const Offset(0, 28),
  });

  /// The content to animate in.
  final Widget child;

  /// How long to wait before the animation starts (used for staggering).
  final Duration delay;

  /// Total length of the fade + slide.
  final Duration duration;

  /// Starting translation, relative to the final resting position.
  final Offset offset;

  @override
  State<FadeSlideIn> createState() => _FadeSlideInState();
}

class _FadeSlideInState extends State<FadeSlideIn>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fade;
  late final Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);

    final curved = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    );
    _fade = curved;
    _slide = Tween<Offset>(
      begin: widget.offset,
      end: Offset.zero,
    ).animate(curved);

    _start();
  }

  Future<void> _start() async {
    if (widget.delay > Duration.zero) {
      await Future<void>.delayed(widget.delay);
      if (!mounted) return;
    }
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => Opacity(
        opacity: _fade.value,
        child: Transform.translate(offset: _slide.value, child: child),
      ),
      child: widget.child,
    );
  }
}
