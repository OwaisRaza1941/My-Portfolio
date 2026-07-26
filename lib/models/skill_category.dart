import 'package:flutter/widgets.dart';

/// Immutable description of one skills-section card: a glyph, the group title,
/// and the individual skills listed inside it as chips.
@immutable
class SkillCategory {
  const SkillCategory({
    required this.icon,
    required this.title,
    required this.skills,
  });

  /// Material glyph shown in the tinted square at the top of the card.
  final IconData icon;

  /// Group heading (e.g. "Languages & Frameworks").
  final String title;

  /// The individual skills, in display order.
  final List<String> skills;
}
