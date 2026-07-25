import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import 'glow_particles.dart';
import 'wave_background.dart';

/// The full premium background atmosphere for the desktop home screen.
///
/// It layers, back to front:
///   1. A dark navy base gradient.
///   2. Two large soft radial glows (top-left accent, bottom-right accent).
///   3. Flowing animated wave lines.
///   4. Drifting glow particles.
///   5. A subtle vignette to keep foreground text readable.
///
/// This composes the individual background widgets so screens only need to drop
/// in a single [AnimatedBackground] behind their content.
class AnimatedBackground extends StatelessWidget {
  const AnimatedBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return const Positioned.fill(
      child: RepaintBoundary(
        child: Stack(
          fit: StackFit.expand,
          children: [
            _BaseGradient(),
            _RadialGlow(
              alignment: Alignment(-0.85, -0.9),
              color: AppColors.primary,
              radius: 0.9,
              opacity: 0.30,
            ),
            _RadialGlow(
              alignment: Alignment(1.0, 0.85),
              color: AppColors.accent,
              radius: 1.1,
              opacity: 0.22,
            ),
            WaveBackground(),
            GlowParticles(),
            _Vignette(),
          ],
        ),
      ),
    );
  }
}

/// Dark navy vertical base gradient.
class _BaseGradient extends StatelessWidget {
  const _BaseGradient();

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.scaffoldBackground,
            AppColors.section,
            AppColors.scaffoldBackground,
          ],
          stops: [0.0, 0.5, 1.0],
        ),
      ),
    );
  }
}

/// A single soft radial glow blob positioned by [alignment].
class _RadialGlow extends StatelessWidget {
  const _RadialGlow({
    required this.alignment,
    required this.color,
    required this.radius,
    required this.opacity,
  });

  final Alignment alignment;
  final Color color;
  final double radius;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: alignment,
          radius: radius,
          colors: [color.withValues(alpha: opacity), color.withValues(alpha: 0)],
          stops: const [0.0, 1.0],
        ),
      ),
    );
  }
}

/// Subtle darkening at the edges to focus attention on the center content.
class _Vignette extends StatelessWidget {
  const _Vignette();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.center,
          radius: 1.2,
          colors: [
            AppColors.scaffoldBackground.withValues(alpha: 0),
            AppColors.scaffoldBackground.withValues(alpha: 0.45),
          ],
          stops: const [0.65, 1.0],
        ),
      ),
    );
  }
}
