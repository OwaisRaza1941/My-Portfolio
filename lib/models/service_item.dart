import 'package:flutter/widgets.dart';

/// Immutable description of one services-section card: a glyph, the service
/// name, a one-paragraph pitch, and the concrete deliverables listed under it.
@immutable
class ServiceItem {
  const ServiceItem({
    required this.icon,
    required this.title,
    required this.description,
    required this.features,
  });

  /// Material glyph shown in the tinted square at the top of the card.
  final IconData icon;

  /// Service name (e.g. "Mobile Apps").
  final String title;

  /// Short pitch shown under the title.
  final String description;

  /// What the service concretely includes, in display order.
  final List<String> features;
}
