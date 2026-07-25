import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Immutable description of one small technology pill that floats around the
/// about-section code window (e.g. "Flutter", "Dart", "Firebase").
@immutable
class TechBadge {
  const TechBadge({
    required this.label,
    required this.icon,
    required this.color,
  });

  final String label;

  /// FontAwesome brand glyph for the technology.
  final FaIconData icon;

  /// Brand tint used for the glyph, border, and glow.
  final Color color;
}
