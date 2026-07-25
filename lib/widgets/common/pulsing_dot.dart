import 'package:flutter/material.dart';

import '../../utils/app_dimensions.dart';
import '../../utils/app_durations.dart';

/// A small filled dot that continuously emits an expanding, fading halo — the
/// classic "live status" indicator. Reused by the hero badge and the floating
/// availability badge to signal activity/availability.
class PulsingDot extends StatefulWidget {
  const PulsingDot({
    super.key,
    required this.color,
    this.size = AppDimensions.availabilityDotSize,
  });

  final Color color;
  final double size;

  @override
  State<PulsingDot> createState() => _PulsingDotState();
}

class _PulsingDotState extends State<PulsingDot>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: AppDurations.availabilityPulse,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final t = _controller.value;
          return Stack(
            alignment: Alignment.center,
            children: [
              // Expanding, fading halo.
              Transform.scale(
                scale: 1 + t * 1.8,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.color.withValues(alpha: (1 - t) * 0.5),
                  ),
                ),
              ),
              // Solid core.
              child!,
            ],
          );
        },
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.color,
            boxShadow: [
              BoxShadow(
                color: widget.color.withValues(alpha: 0.6),
                blurRadius: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
