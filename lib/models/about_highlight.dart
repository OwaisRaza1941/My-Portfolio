import 'package:flutter/widgets.dart';

/// Immutable description of a single "what I bring" tile in the about section.
@immutable
class AboutHighlight {
  const AboutHighlight({
    required this.icon,
    required this.title,
    required this.body,
  });

  /// Material glyph shown in the tinted square at the top of the tile.
  final IconData icon;

  /// Short tile heading (e.g. "Clean Architecture").
  final String title;

  /// One-line supporting sentence.
  final String body;
}
