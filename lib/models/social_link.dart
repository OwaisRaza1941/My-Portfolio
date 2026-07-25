import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Immutable description of a single social media link rendered in the hero.
@immutable
class SocialLink {
  const SocialLink({
    required this.label,
    required this.icon,
    required this.url,
    required this.brandColor,
  });

  /// Accessible label / tooltip (e.g. "GitHub").
  final String label;

  /// FontAwesome glyph for the platform.
  final FaIconData icon;

  /// Destination opened when the icon is tapped.
  final String url;

  /// Platform brand color used for the hover glow accent.
  final Color brandColor;
}
