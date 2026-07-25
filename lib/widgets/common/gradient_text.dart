import 'package:flutter/material.dart';

import '../../utils/app_color.dart';

/// Paints [text] with a linear gradient fill by masking a solid [Text] with a
/// shader. Used for the hero name and role to give the headline a premium,
/// electric-blue sheen.
class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    super.key,
    required this.style,
    this.gradient = _defaultGradient,
    this.textAlign = TextAlign.start,
  });

  final String text;
  final TextStyle style;
  final Gradient gradient;
  final TextAlign textAlign;

  static const LinearGradient _defaultGradient = LinearGradient(
    colors: [
      AppColors.textPrimary,
      AppColors.accentGlow,
      AppColors.primaryLight,
    ],
  );

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      blendMode: BlendMode.srcIn,
      child: Text(
        text,
        textAlign: textAlign,
        // The color here is irrelevant; the shader replaces it. White ensures
        // full opacity so the gradient renders at its true colors.
        style: style.copyWith(color: AppColors.textPrimary),
      ),
    );
  }
}
