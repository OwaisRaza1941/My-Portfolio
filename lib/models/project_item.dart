import 'package:flutter/widgets.dart';

/// Immutable description of one portfolio project: the screenshot shown in its
/// device frame, the copy beside it, and the links it opens.
@immutable
class ProjectItem {
  const ProjectItem({
    required this.title,
    required this.category,
    required this.description,
    required this.imageAsset,
    required this.features,
    required this.tech,
    required this.repoUrl,
    this.liveUrl,
    this.screenshots = const [],
  });

  /// Project name (e.g. "SwiftCart").
  final String title;

  /// Short domain label shown in the pill above the title (e.g. "E-Commerce").
  final String category;

  /// One-paragraph pitch shown under the title.
  final String description;

  /// Portrait app screenshot, rendered inside the device frame.
  final String imageAsset;

  /// What the app concretely does, in display order.
  final List<String> features;

  /// Technology pills listed under the copy.
  final List<String> tech;

  /// Repository the "View Code" action opens.
  final String repoUrl;

  /// Optional live build. When null the row shows only the code action.
  final String? liveUrl;

  /// Extra screenshots shown in the zoom gallery, in swipe order. When empty
  /// the gallery falls back to just [imageAsset].
  final List<String> screenshots;
}
