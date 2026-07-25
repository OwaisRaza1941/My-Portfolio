import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import '../../utils/app_durations.dart';

/// Animated flowing "SVG style" wave lines that drift horizontally across the
/// background, evoking the premium, futuristic feel of the reference design.
///
/// Several sine-wave strokes of varying amplitude, frequency and phase are
/// painted with a soft blue gradient and blur, then continuously shifted to
/// create an endless flowing motion.
class WaveBackground extends StatefulWidget {
  const WaveBackground({super.key});

  @override
  State<WaveBackground> createState() => _WaveBackgroundState();
}

class _WaveBackgroundState extends State<WaveBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: AppDurations.backgroundWave,
    )..repeat();
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
          painter: _WavePainter(progress: _controller.value),
          size: Size.infinite,
        ),
      ),
    );
  }
}

/// Immutable description of a single wave stroke.
class _WaveConfig {
  const _WaveConfig({
    required this.amplitude,
    required this.wavelength,
    required this.verticalFraction,
    required this.speed,
    required this.opacity,
    required this.strokeWidth,
  });

  final double amplitude;
  final double wavelength;

  /// Vertical baseline as a fraction of the canvas height.
  final double verticalFraction;

  /// Horizontal drift multiplier.
  final double speed;
  final double opacity;
  final double strokeWidth;
}

class _WavePainter extends CustomPainter {
  _WavePainter({required this.progress});

  /// Normalized [0, 1) animation progress.
  final double progress;

  // Layered waves — tuned for a calm, elegant flow rather than a busy one.
  static const List<_WaveConfig> _waves = [
    _WaveConfig(
      amplitude: 46,
      wavelength: 520,
      verticalFraction: 0.32,
      speed: 1.0,
      opacity: 0.28,
      strokeWidth: 2,
    ),
    _WaveConfig(
      amplitude: 34,
      wavelength: 420,
      verticalFraction: 0.5,
      speed: -0.7,
      opacity: 0.20,
      strokeWidth: 1.6,
    ),
    _WaveConfig(
      amplitude: 58,
      wavelength: 640,
      verticalFraction: 0.68,
      speed: 0.55,
      opacity: 0.16,
      strokeWidth: 2.4,
    ),
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final blur = MaskFilter.blur(BlurStyle.normal, 3);

    for (final wave in _waves) {
      final paint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = wave.strokeWidth
        ..strokeCap = StrokeCap.round
        ..maskFilter = blur
        ..shader = LinearGradient(
          colors: [
            AppColors.primary.withValues(alpha: 0),
            AppColors.primaryLight.withValues(alpha: wave.opacity),
            AppColors.accentGlow.withValues(alpha: wave.opacity * 0.8),
            AppColors.primary.withValues(alpha: 0),
          ],
          stops: const [0.0, 0.35, 0.65, 1.0],
        ).createShader(Offset.zero & size);

      final path = Path();
      final baseline = size.height * wave.verticalFraction;
      // Phase shift driven by the animation, scaled by each wave's speed.
      final phase = progress * 2 * math.pi * wave.speed;

      for (double x = 0; x <= size.width; x += 6) {
        final y =
            baseline +
            math.sin((x / wave.wavelength * 2 * math.pi) + phase) *
                wave.amplitude;
        if (x == 0) {
          path.moveTo(x, y);
        } else {
          path.lineTo(x, y);
        }
      }
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(_WavePainter oldDelegate) =>
      oldDelegate.progress != progress;
}
