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
      type: ProjectType.mobileApp,
      screenshots: [
        'assets/images/swiftcart_app.png',
        'assets/images/swiftcart_product_details.png',
        'assets/images/swiftcart_favorite.png',
        'assets/images/swiftcart_cart.png',
        'assets/images/swiftcart_order.png',
        'assets/images/swiftcart_reviews.png',
      ],
    ),
    ProjectItem(
      title: AppStrings.projectFoodTitle,
      category: AppStrings.projectFoodCategory,
      description: AppStrings.projectFoodBody,
      imageAsset: 'assets/images/bobo_food_home.png',
      features: AppStrings.projectFoodFeatures,
      tech: AppStrings.projectFoodTech,
      repoUrl: AppStrings.githubUrl,
      type: ProjectType.mobileApp,
      liveUrl: AppStrings.boboLiveUrl,
      screenshots: [
        'assets/images/bobo_food_home.png',
        'assets/images/bobo_food_details.png',
        'assets/images/bobo_explore.png',
        'assets/images/bobo_fav.png',
        'assets/images/bobo_cart.png',
        'assets/images/bobo_assistant.png',
      ],
    ),
    ProjectItem(
      title: AppStrings.projectNestAiTitle,
      category: AppStrings.projectNestAiCategory,
      description: AppStrings.projectNestAiBody,
      imageAsset: 'assets/images/real_state_website_home.png',
      features: AppStrings.projectNestAiFeatures,
      tech: AppStrings.projectNestAiTech,
      repoUrl: AppStrings.githubUrl,
      liveUrl: AppStrings.nestAiLiveUrl,
      type: ProjectType.website,
      screenshots: [
        'assets/images/real_state_website_home.png',
        'assets/images/real_state_website_listing.png',
        'assets/images/real_state_website_details.png',
        'assets/images/real_state_website_about.png',
        'assets/images/real_state_website_contact.png',
        'assets/images/real_state_website_conatct_agent.png',
      ],
    ),

    // ==================== Marina Co ====================
    ProjectItem(
      title: AppStrings.projectFishWebsiteTitle,
      category: AppStrings.projectFishWebsiteCategory,
      description: AppStrings.projectFishWebsiteBody,
      imageAsset: 'assets/images/marina_co_services.png',
      features: AppStrings.projectFishWebsiteFeatures,
      tech: AppStrings.projectFishWebsiteTech,
      repoUrl: AppStrings.githubUrl,
      liveUrl: 'https://marina-co-websites.vercel.app/#home',
      type: ProjectType.website,
      screenshots: [
        'assets/images/marina_co_services.png',
        'assets/images/marina_co_ourcraft.png',
        'assets/images/marina_co_voices.png',
        'assets/images/marina_co_gallery.png',
        'assets/images/marina_co_contact.png',
        'assets/images/marina_co_footer.png'
      ],
    ),

    // ==================== Avari Tower ====================
    ProjectItem(
      title: AppStrings.projectRestaurantTitle,
      category: AppStrings.projectRestaurantCategory,
      description: AppStrings.projectRestaurantBody,
      imageAsset: 'assets/images/aisa_website_home.png',
      features: AppStrings.projectRestaurantFeatures,
      tech: AppStrings.projectRestaurantTech,
      repoUrl: AppStrings.githubUrl,
      liveUrl: 'https://aisa-live-avari-tower-websites.vercel.app/',
      type: ProjectType.website,
      screenshots: [
        'assets/images/aisa_website_home.png',
        'assets/images/aisa_website_gallery.png',
        'assets/images/aisa_website_feeling.png',
        'assets/images/aisa_website_ourstory.png',
        'assets/images/aisa_reveiws.png',
        'assets/images/aisa_website_map.png',
      ],
    ),

    // ==================== MedCare ====================
    ProjectItem(
      title: AppStrings.projectMedicareTitle,
      category: AppStrings.projectMedicareCategory,
      description: AppStrings.projectMedicareBody,
      imageAsset: 'assets/images/medicare_home.png',
      features: AppStrings.projectMedicareFeatures,
      tech: AppStrings.projectMedicareTech,
      repoUrl: AppStrings.githubUrl,
      liveUrl: 'https://medicare-website-pi.vercel.app/',
      type: ProjectType.website,
      screenshots: [
        'assets/images/medicare_home.png',
        'assets/images/medicare_services.png',
        'assets/images/medicare_doctors.png',
        'assets/images/medicare_about.png',
        'assets/images/medicare_contact.png',
        'assets/images/medicare_footer.png',
      ],
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
                delay: AppDurations.stagger * (_headerSteps + projects.length),
                child: ProjectsFooter(onBrowseAll: onBrowseAll),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
