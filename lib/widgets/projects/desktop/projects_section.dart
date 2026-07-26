import 'package:flutter/material.dart';

import '../../../models/project_item.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/app_durations.dart';
import '../../../utils/app_strings.dart';
import '../../common/fade_slide_in.dart';
import 'project_showcase.dart';
import 'projects_footer.dart';
import 'projects_header.dart';

/// The full desktop projects section: a centered header over four alternating
/// showcase rows, closed by a "more on GitHub" panel.
///
/// ```
///                        💼 MY WORK
///                    Featured Projects
///         A selection of Flutter apps I designed and shipped…
///
///   [ 📱 ]   01 —— E-COMMERCE            02 —— MESSAGING   [ 📱 ]
///            SwiftCart                   Realtime Chat App
///
///   [ More on GitHub            (Browse All Projects) ]
/// ```
///
/// Purely presentational, like the other sections — the copy lives in
/// [AppStrings], the layout constants in [AppDimensions], and link opening
/// comes down from the owning screen.
class ProjectsSection extends StatelessWidget {
  const ProjectsSection({
    super.key,
    required this.onOpenUrl,
    required this.onBrowseAll,
  });

  /// Opens a project's repository or live build.
  final ValueChanged<String> onOpenUrl;

  /// Fired by the closing GitHub panel.
  final VoidCallback onBrowseAll;

  /// Every project, in reading order — which is also the order the "01…04"
  /// labels and the left/right alternation follow.
  static const List<ProjectItem> projects = [
    ProjectItem(
      title: AppStrings.projectSwiftCartTitle,
      category: AppStrings.projectSwiftCartCategory,
      description: AppStrings.projectSwiftCartBody,
      imageAsset: 'assets/images/swiftcart_app.png',
      features: AppStrings.projectSwiftCartFeatures,
      tech: AppStrings.projectSwiftCartTech,
      repoUrl: AppStrings.githubUrl,
    ),
    ProjectItem(
      title: AppStrings.projectChatTitle,
      category: AppStrings.projectChatCategory,
      description: AppStrings.projectChatBody,
      imageAsset: 'assets/images/chat_app.png',
      features: AppStrings.projectChatFeatures,
      tech: AppStrings.projectChatTech,
      repoUrl: AppStrings.githubUrl,
    ),
    ProjectItem(
      title: AppStrings.projectFoodTitle,
      category: AppStrings.projectFoodCategory,
      description: AppStrings.projectFoodBody,
      imageAsset: 'assets/images/food_app.png',
      features: AppStrings.projectFoodFeatures,
      tech: AppStrings.projectFoodTech,
      repoUrl: AppStrings.githubUrl,
    ),
    ProjectItem(
      title: AppStrings.projectTaskTitle,
      category: AppStrings.projectTaskCategory,
      description: AppStrings.projectTaskBody,
      imageAsset: 'assets/images/task_manager_app.png',
      features: AppStrings.projectTaskFeatures,
      tech: AppStrings.projectTaskTech,
      repoUrl: AppStrings.githubUrl,
    ),
  ];

  /// How many stagger steps the header consumes before the rows start.
  static const int _headerSteps = 4;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: AppDimensions.maxContentWidth,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.pageHorizontalPadding,
            vertical: AppDimensions.projectsSectionVerticalPadding,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Center(child: ProjectsHeader()),
              const SizedBox(height: AppDimensions.projectsHeaderBottomGap),

              for (var i = 0; i < projects.length; i++) ...[
                if (i > 0) const SizedBox(height: AppDimensions.projectsRowGap),
                FadeSlideIn(
                  delay: AppDurations.stagger * (_headerSteps + i),
                  child: ProjectShowcase(
                    project: projects[i],
                    index: i,
                    onOpenUrl: onOpenUrl,
                  ),
                ),
              ],
              const SizedBox(height: AppDimensions.projectsFooterTopGap),

              // The panel closes the section, so it enters after every row.
              FadeSlideIn(
                delay:
                    AppDurations.stagger * (_headerSteps + projects.length),
                child: ProjectsFooter(onBrowseAll: onBrowseAll),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
