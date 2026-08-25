import 'package:flutter/material.dart';

import '../../../models/project_item.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/app_durations.dart';
import '../../common/fade_slide_in.dart';
import 'project_card.dart';

/// Lays [projects] out as a responsive grid of [ProjectCard]s: as many
/// columns as fit at [AppDimensions.projectsGridMinTileWidth] each, capped at
/// [AppDimensions.projectsGridMaxColumns].
///
/// The same widget powers the desktop, tablet and mobile sections — on a
/// phone-width column it settles to a single column on its own, so there's no
/// separate stacked layout to maintain.
class ProjectsGrid extends StatelessWidget {
  const ProjectsGrid({
    super.key,
    required this.projects,
    required this.onOpenUrl,
    this.headerSteps = 4,
  });

  final List<ProjectItem> projects;

  /// Opens a project's repository or live build.
  final ValueChanged<String> onOpenUrl;

  /// How many stagger steps the header above the grid consumes, so the first
  /// card's entrance continues that rhythm rather than restarting it.
  final int headerSteps;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const spacing = AppDimensions.projectsGridSpacing;
        final columns = (constraints.maxWidth /
                AppDimensions.projectsGridMinTileWidth)
            .floor()
            .clamp(1, AppDimensions.projectsGridMaxColumns);
        final tileWidth =
            (constraints.maxWidth - spacing * (columns - 1)) / columns;

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: [
            for (var i = 0; i < projects.length; i++)
              SizedBox(
                width: tileWidth,
                child: FadeSlideIn(
                  delay: AppDurations.stagger * (headerSteps + i),
                  child: ProjectCard(
                    project: projects[i],
                    onOpenUrl: onOpenUrl,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
