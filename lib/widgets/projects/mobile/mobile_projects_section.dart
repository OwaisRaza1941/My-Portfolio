import 'package:flutter/material.dart';

import '../../../utils/app_dimensions.dart';
import '../../../utils/app_durations.dart';
import '../../common/fade_slide_in.dart';
import '../desktop/projects_footer.dart';
import '../desktop/projects_grid.dart';
import '../desktop/projects_header.dart';
import '../desktop/projects_section.dart';

/// The projects section on phones: the same header, card grid and closing
/// GitHub panel as desktop, dropped to a single stacked column.
///
/// [ProjectsGrid] computes its own column count from the available width, so
/// a phone-width column settles to one card per row on its own — no separate
/// stacked layout to maintain here.
///
/// Only the type scale and the section rhythm are stepped down; everything
/// else comes from the desktop widgets unchanged.
class MobileProjectsSection extends StatelessWidget {
  const MobileProjectsSection({
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
          maxWidth: AppDimensions.mobileProjectsMaxWidth,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.mobileProjectsHorizontalPadding,
            vertical: AppDimensions.mobileProjectsSectionVerticalPadding,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Center(
                child: ProjectsHeader(
                  titleFontSize: AppDimensions.mobileAboutTitleFontSize,
                  subtitleFontSize: AppDimensions.mobileAboutSubtitleFontSize,
                  maxWidth: AppDimensions.mobileProjectsMaxWidth,
                ),
              ),
              const SizedBox(
                height: AppDimensions.mobileProjectsHeaderBottomGap,
              ),

              ProjectsGrid(
                projects: projects,
                onOpenUrl: onOpenUrl,
                headerSteps: _headerSteps,
              ),
              const SizedBox(height: AppDimensions.mobileProjectsFooterTopGap),

              // The panel closes the section, so it enters after every card.
              FadeSlideIn(
                delay: AppDurations.stagger * (_headerSteps + projects.length),
                child: ProjectsFooter(
                  onBrowseAll: onBrowseAll,
                  titleFontSize:
                      AppDimensions.mobileProjectsFooterTitleFontSize,
                  bodyFontSize: AppDimensions.mobileProjectsFooterBodyFontSize,
                  padding: AppDimensions.mobileProjectsFooterPadding,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
