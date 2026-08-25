import 'package:flutter/material.dart';

import '../../../utils/app_dimensions.dart';
import '../../../utils/app_durations.dart';
import '../../common/fade_slide_in.dart';
import '../desktop/projects_footer.dart';
import '../desktop/projects_grid.dart';
import '../desktop/projects_header.dart';
import '../desktop/projects_section.dart';

/// The projects section on tablets: the same header, responsive card grid and
/// closing GitHub panel as desktop, stepped down to the tablet measure.
///
/// ```
///                     💼 MY WORK
///                  Featured Projects
///        A selection of Flutter apps I designed and shipped…
///
///   [ SwiftCart ]     [ BoBo Food ]
///   [ EstateAI  ]     [ MediCare  ]
///
///   [ More on GitHub        (Browse All Projects) ]
/// ```
///
/// [ProjectsGrid] computes its own column count from the available width, so
/// the 700pt tablet column naturally settles to two cards per row without any
/// breakpoint of its own.
///
/// Purely presentational, like the desktop section — the project list stays in
/// [ProjectsSection] and link opening comes down from the owning screen.
class TabletProjectsSection extends StatelessWidget {
  const TabletProjectsSection({
    super.key,
    required this.onOpenUrl,
    required this.onBrowseAll,
  });

  /// Opens a project's repository or live build.
  final ValueChanged<String> onOpenUrl;

  /// Fired by the closing GitHub panel.
  final VoidCallback onBrowseAll;

  /// How many stagger steps the header consumes before the grid starts.
  static const int _headerSteps = 4;

  @override
  Widget build(BuildContext context) {
    const projects = ProjectsSection.projects;

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: AppDimensions.tabletProjectsMaxWidth,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.tabletHorizontalPadding,
            vertical: AppDimensions.tabletProjectsSectionVerticalPadding,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Center(
                child: ProjectsHeader(
                  titleFontSize: AppDimensions.tabletAboutTitleFontSize,
                  subtitleFontSize: AppDimensions.tabletAboutSubtitleFontSize,
                  maxWidth: AppDimensions.tabletProjectsHeaderMaxWidth,
                ),
              ),
              const SizedBox(
                height: AppDimensions.tabletProjectsHeaderBottomGap,
              ),

              ProjectsGrid(
                projects: projects,
                onOpenUrl: onOpenUrl,
                headerSteps: _headerSteps,
              ),
              const SizedBox(height: AppDimensions.tabletProjectsFooterTopGap),

              // The panel closes the section, so it enters after every card.
              FadeSlideIn(
                delay: AppDurations.stagger * (_headerSteps + projects.length),
                child: ProjectsFooter(
                  onBrowseAll: onBrowseAll,
                  titleFontSize:
                      AppDimensions.tabletProjectsFooterTitleFontSize,
                  bodyFontSize: AppDimensions.tabletProjectsFooterBodyFontSize,
                  padding: AppDimensions.tabletProjectsFooterPadding,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
