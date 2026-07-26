import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Immutable description of a single social media link rendered in the hero.
@immutable
class SocialLink {
  const SocialLink({
    required this.label,
    required this.url,
    required this.brandColor,
    this.icon,
    this.assetPath,
  }) : assert(
         (icon == null) != (assetPath == null),
         'Give a link exactly one of icon or assetPath.',
       );

  /// Accessible label / tooltip (e.g. "GitHub").
  final String label;

  /// FontAwesome glyph for the platform, when the pack ships one.
  final FaIconData? icon;

  /// Transparent PNG used instead of [icon] for platforms FontAwesome lacks
  /// (Fiverr). Tinted at render time, so it must be a single-color mark.
  final String? assetPath;

  /// Destination opened when the icon is tapped.
  final String url;

  /// Platform brand color used for the hover glow accent.
  final Color brandColor;
}
