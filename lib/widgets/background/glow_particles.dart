import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import '../../utils/app_durations.dart';

/// A field of soft, slowly drifting glow particles that float upward and gently
/// pulse, adding depth and atmosphere behind the hero content.
///
/// Particle positions are generated once from a fixed seed so the layout is
/// stable across rebuilds; only their vertical drift and opacity animate.
class GlowParticles extends StatefulWidget {
  const GlowParticles({super.key, this.particleCount = 26});

  final int particleCount;

  @override
  State<GlowParticles> createState() => _GlowParticlesState();
}

class _GlowParticlesState extends State<GlowParticles>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final List<_Particle> _particles;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: AppDurations.particleDrift,
    )..repeat();
    _particles = _generateParticles(widget.particleCount);
  }

  List<_Particle> _generateParticles(int count) {
    // Fixed seed → deterministic, non-jittery layout.
    final random = math.Random(42);
    return List<_Particle>.generate(count, (_) {
      return _Particle(
        dx: random.nextDouble(),
        dy: random.nextDouble(),
        radius: 1.2 + random.nextDouble() * 3.2,
        driftSpeed: 0.4 + random.nextDouble() * 0.9,
        phase: random.nextDouble(),
        baseOpacity: 0.25 + random.nextDouble() * 0.45,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) => CustomPaint(
          painter: _ParticlePainter(
            particles: _particles,
            progress: _controller.value,
          ),
          size: Size.infinite,
        ),
      ),
    );
  }
}

/// Immutable per-particle configuration, expressed in fractional coordinates so
/// it scales to any canvas size.
class _Particle {
  const _Particle({
    required this.dx,
    required this.dy,
    required this.radius,
    required this.driftSpeed,
    required this.phase,
    required this.baseOpacity,
  });

  final double dx;
  final double dy;
  final double radius;
  final double driftSpeed;
  final double phase;
  final double baseOpacity;
}

class _ParticlePainter extends CustomPainter {
  _ParticlePainter({required this.particles, required this.progress});

  final List<_Particle> particles;
  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    for (final p in particles) {
      // Drift upward and wrap around, offset by each particle's speed & phase.
      final travel = (progress * p.driftSpeed + p.phase) % 1.0;
      final y = (p.dy - travel) % 1.0 * size.height;
      final x = p.dx * size.width;

      // Gentle twinkle via a sine on opacity.
      final twinkle =
          0.6 + 0.4 * math.sin((progress + p.phase) * 2 * math.pi);
      final opacity = (p.baseOpacity * twinkle).clamp(0.0, 1.0);

      final center = Offset(x, y);
      final paint = Paint()
        ..color = AppColors.accentGlow.withValues(alpha: opacity)
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, p.radius * 1.6);

      canvas.drawCircle(center, p.radius, paint);
    }
  }

  @override
  bool shouldRepaint(_ParticlePainter oldDelegate) =>
      oldDelegate.progress != progress;
}
