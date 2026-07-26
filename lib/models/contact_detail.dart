import 'package:flutter/widgets.dart';

/// A single row in the contact info column, e.g. "Email — owais@…".
@immutable
class ContactDetail {
  const ContactDetail({
    required this.icon,
    required this.label,
    required this.value,
    this.url,
  });

  /// Glyph shown in the tinted square at the start of the tile.
  final IconData icon;

  /// Small upper-case caption above the value (e.g. "Email").
  final String label;

  /// The detail itself (e.g. the address or the location).
  final String value;

  /// Optional destination. Tiles without one are informational and render
  /// without hover or a click cursor.
  final String? url;
}
