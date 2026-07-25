import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../utils/app_dimensions.dart';
import '../../utils/app_durations.dart';

/// Continuously floats its [child] up and down with a smooth sine motion,
/// giving elements a weightless, premium feel. Used for the hero profile image
/// and its floating badge.
class Floating extends StatefulWidget {
  const Floating({
    super.key,
    required this.child,
    this.amplitude = AppDimensions.profileFloatAmplitude,
    this.duration = AppDurations.profileFloat,
    this.phaseOffset = 0,
  });

  final Widget child;

  /// Vertical travel distance in logical pixels (peak to center).
  final double amplitude;

  /// Time for one full up-and-down cycle.
  final Duration duration;

  /// Phase offset (0–1) so multiple floating elements can move out of sync.
  final double phaseOffset;

  @override
  State<Floating> createState() => _FloatingState();
}

class _FloatingState extends State<Floating>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat();
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
      builder: (context, child) {
        final angle = (_controller.value + widget.phaseOffset) * 2 * math.pi;
        final dy = math.sin(angle) * widget.amplitude;
        return Transform.translate(offset: Offset(0, dy), child: child);
      },
      child: widget.child,
    );
  }
}
