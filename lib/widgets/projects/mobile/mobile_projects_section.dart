import 'package:flutter/material.dart';

import '../../../utils/app_dimensions.dart';
import '../../../utils/app_durations.dart';
import '../../common/fade_slide_in.dart';
import '../desktop/project_showcase.dart';
import '../desktop/projects_footer.dart';
import '../desktop/projects_header.dart';
import '../desktop/projects_section.dart';

/// The projects section on phones: the same header, showcase rows and closing
/// GitHub panel as desktop, dropped to a single stacked column.
///
/// Every row stacks the screenshot above its copy — [double.infinity] as the
/// stack breakpoint says so outright rather than leaving it to a width
/// comparison the phone could never win. Alternation is switched off with it:
/// once the preview always sits on top, mirroring odd rows would only shuffle
/// the reading order without changing the picture.
///
/// Only the type scale, the screenshot width and the section rhythm are stepped
/// down; everything else comes from the desktop widgets unchanged.
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

  /// How many stagger steps the header consumes before the rows start.
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

              for (var i = 0; i < projects.length; i++) ...[
                if (i > 0)
                  const SizedBox(height: AppDimensions.mobileProjectsRowGap),
                FadeSlideIn(
                  delay: AppDurations.stagger * (_headerSteps + i),
                  child: ProjectShowcase(
                    project: projects[i],
                    index: i,
                    onOpenUrl: onOpenUrl,
                    previewWidth: AppDimensions.mobileProjectPreviewWidth,
                    columnGap: AppDimensions.mobileProjectsColumnGap,
                    stackBreakpoint: double.infinity,
                    contentMaxWidth: AppDimensions.mobileProjectsMaxWidth,
                    alternate: false,
                    indexFontSize: AppDimensions.mobileProjectIndexFontSize,
                    titleFontSize: AppDimensions.mobileProjectTitleFontSize,
                    bodyFontSize: AppDimensions.mobileProjectBodyFontSize,
                    featureFontSize:
                        AppDimensions.mobileProjectFeatureFontSize,
                    chipFontSize: AppDimensions.mobileProjectChipFontSize,
                    actionButtonHeight:
                        AppDimensions.mobileProjectActionButtonHeight,
                    actionFontSize: AppDimensions.mobileProjectActionFontSize,
                  ),
                ),
              ],
              const SizedBox(height: AppDimensions.mobileProjectsFooterTopGap),

              // The panel closes the section, so it enters after every row.
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
