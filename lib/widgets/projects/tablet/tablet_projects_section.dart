import 'package:flutter/material.dart';

import '../../../utils/app_dimensions.dart';
import '../../../utils/app_durations.dart';
import '../../common/fade_slide_in.dart';
import '../desktop/project_showcase.dart';
import '../desktop/projects_footer.dart';
import '../desktop/projects_header.dart';
import '../desktop/projects_section.dart';

/// The projects section on tablets: the same header, alternating showcase rows
/// and closing GitHub panel as desktop, stepped down to the tablet measure.
///
/// ```
///                     💼 MY WORK
///                  Featured Projects
///        A selection of Flutter apps I designed and shipped…
///
///   [ 📱 ]  01 —— E-COMMERCE      02 —— MESSAGING  [ 📱 ]
///           SwiftCart             Realtime Chat App
///
///   [ More on GitHub        (Browse All Projects) ]
/// ```
///
/// The rows keep alternating here — the 700pt column still holds a 240pt
/// screenshot beside a readable paragraph, so mirroring stays a rhythm rather
/// than a shuffle. Only once a row falls under
/// [AppDimensions.tabletProjectsStackBreakpoint] does it stack on its own.
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

  /// How many stagger steps the header consumes before the rows start.
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

              for (var i = 0; i < projects.length; i++) ...[
                if (i > 0)
                  const SizedBox(height: AppDimensions.tabletProjectsRowGap),
                FadeSlideIn(
                  delay: AppDurations.stagger * (_headerSteps + i),
                  child: ProjectShowcase(
                    project: projects[i],
                    index: i,
                    onOpenUrl: onOpenUrl,
                    previewWidth: AppDimensions.tabletProjectPreviewWidth,
                    columnGap: AppDimensions.tabletProjectsColumnGap,
                    stackBreakpoint:
                        AppDimensions.tabletProjectsStackBreakpoint,
                    contentMaxWidth: AppDimensions.tabletProjectsMaxWidth,
                    indexFontSize: AppDimensions.tabletProjectIndexFontSize,
                    titleFontSize: AppDimensions.tabletProjectTitleFontSize,
                    bodyFontSize: AppDimensions.tabletProjectBodyFontSize,
                    featureFontSize:
                        AppDimensions.tabletProjectFeatureFontSize,
                    chipFontSize: AppDimensions.tabletProjectChipFontSize,
                    actionButtonHeight:
                        AppDimensions.tabletProjectActionButtonHeight,
                    actionFontSize: AppDimensions.tabletProjectActionFontSize,
                  ),
                ),
              ],
              const SizedBox(height: AppDimensions.tabletProjectsFooterTopGap),

              // The panel closes the section, so it enters after every row.
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
