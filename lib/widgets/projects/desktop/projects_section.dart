import 'package:flutter/material.dart';

import '../../../models/project_item.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/app_durations.dart';
import '../../../utils/app_strings.dart';
import '../../common/fade_slide_in.dart';
import 'projects_footer.dart';
import 'projects_grid.dart';
import 'projects_header.dart';

/// The full desktop projects section: a centered header over a responsive
/// grid of project cards, closed by a "more on GitHub" panel.
///
/// ```
///                        💼 MY WORK
///                    Featured Projects
///         A selection of Flutter apps I designed and shipped…
///
///   [ SwiftCart ]   [ BoBo Food ]    [ EstateAI ]
///   [ MediCare  ]   [ FitZone   ]    [ RentEasy ]
///
///   [ More on GitHub            (Browse All Projects) ]
/// ```
///
/// Each card's screenshot opens full-screen over a blurred backdrop on tap —
/// from a mouse click or a touch tap alike — via [ProjectsGrid].
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

  /// Every project, in reading order — which is also the order the grid
  /// fills, left to right then down.
  static const List<ProjectItem> projects = [
    ProjectItem(
      title: AppStrings.projectSwiftCartTitle,
      category: AppStrings.projectSwiftCartCategory,
      description: AppStrings.projectSwiftCartBody,
      imageAsset: 'assets/images/swiftcart_app.png',
      features: AppStrings.projectSwiftCartFeatures,
      tech: AppStrings.projectSwiftCartTech,
      repoUrl: AppStrings.swiftCartRepoUrl,
      liveUrl: AppStrings.swiftCartRepoUrl,
      screenshots: [
        'assets/images/swiftcart_app.png',
        'assets/images/swiftcart_cart.jpeg',
        'assets/images/swiftcart_order.jpeg',
        'assets/images/swiftcart_product_details.jpeg',
        'assets/images/swiftcart_reviews.jpeg',
      ],
    ),
    ProjectItem(
      title: AppStrings.projectFoodTitle,
      category: AppStrings.projectFoodCategory,
      description: AppStrings.projectFoodBody,
      imageAsset: 'assets/images/bobo_assistant.jpeg',
      features: AppStrings.projectFoodFeatures,
      tech: AppStrings.projectFoodTech,
      repoUrl: AppStrings.githubUrl,
      screenshots: [
        'assets/images/bobo_assistant.jpeg',
        'assets/images/bobo_explore.jpeg',
        'assets/images/bobo_food_details.jpeg',
        'assets/images/bobo_order.jpeg',
        'assets/images/bobo_drawer.jpeg',
      ],
    ),
    ProjectItem(
      title: AppStrings.projectRealEstateTitle,
      category: AppStrings.projectRealEstateCategory,
      description: AppStrings.projectRealEstateBody,
      imageAsset: 'assets/images/real_estate_app.png',
      features: AppStrings.projectRealEstateFeatures,
      tech: AppStrings.projectRealEstateTech,
      repoUrl: AppStrings.githubUrl,
    ),
    ProjectItem(
      title: AppStrings.projectMedicalTitle,
      category: AppStrings.projectMedicalCategory,
      description: AppStrings.projectMedicalBody,
      imageAsset: 'assets/images/medical_app.png',
      features: AppStrings.projectMedicalFeatures,
      tech: AppStrings.projectMedicalTech,
      repoUrl: AppStrings.githubUrl,
    ),
    ProjectItem(
      title: AppStrings.projectGymTitle,
      category: AppStrings.projectGymCategory,
      description: AppStrings.projectGymBody,
      imageAsset: 'assets/images/gym_app.png',
      features: AppStrings.projectGymFeatures,
      tech: AppStrings.projectGymTech,
      repoUrl: AppStrings.githubUrl,
    ),
    ProjectItem(
      title: AppStrings.projectHouseRentTitle,
      category: AppStrings.projectHouseRentCategory,
      description: AppStrings.projectHouseRentBody,
      imageAsset: 'assets/images/house_rent_app.png',
      features: AppStrings.projectHouseRentFeatures,
      tech: AppStrings.projectHouseRentTech,
      repoUrl: AppStrings.githubUrl,
    ),
  ];

  /// How many stagger steps the header consumes before the grid starts.
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

              ProjectsGrid(
                projects: projects,
                onOpenUrl: onOpenUrl,
                headerSteps: _headerSteps,
              ),
              const SizedBox(height: AppDimensions.projectsFooterTopGap),

              // The panel closes the section, so it enters after every card.
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
