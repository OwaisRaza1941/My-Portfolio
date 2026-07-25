import 'package:flutter/foundation.dart';

/// Immutable description of a single navigation bar entry.
@immutable
class NavItem {
  const NavItem({required this.label, required this.anchor});

  /// Text shown in the navbar.
  final String label;

  /// Logical section identifier this item scrolls to. Wiring the actual scroll
  /// behaviour is handled by the screen that owns the sections.
  final String anchor;
}
