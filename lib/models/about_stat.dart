import 'package:flutter/foundation.dart';

/// Immutable description of a single headline number in the about section
/// (e.g. "2+" / "Years Experience").
@immutable
class AboutStat {
  const AboutStat({required this.value, required this.label});

  /// The large, gradient-filled figure (e.g. "15+").
  final String value;

  /// The muted caption beneath it.
  final String label;
}
