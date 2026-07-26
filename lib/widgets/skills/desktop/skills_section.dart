import 'package:flutter/material.dart';

import '../../../models/skill_category.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/app_strings.dart';
import 'skills_grid.dart';
import 'skills_header.dart';

/// The full desktop skills section: a centered header over a masonry grid of
/// category cards.
///
/// ```
///                        ⚡ MY SKILLS
///                 Technologies I Work With
///        The tools, frameworks and practices I use every day…
///
///   [ Languages ]   [ Mobile Dev ]   [ State Mgmt ]
///   [ Database  ]   [ API        ]   [ Tools      ]
/// ```
///
/// Purely presentational, like the hero and about sections — the copy lives in
/// [AppStrings] and the layout constants in [AppDimensions].
class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  /// Every skill group, in reading order. The grid re-balances them across its
  /// columns, so this order drives the entrance stagger rather than the layout.
  static const List<SkillCategory> categories = [
    SkillCategory(
      icon: Icons.code_rounded,
      title: AppStrings.skillsLanguagesTitle,
      skills: AppStrings.skillsLanguages,
    ),
    SkillCategory(
      icon: Icons.phone_iphone_rounded,
      title: AppStrings.skillsMobileTitle,
      skills: AppStrings.skillsMobile,
    ),
    SkillCategory(
      icon: Icons.account_tree_outlined,
      title: AppStrings.skillsStateTitle,
      skills: AppStrings.skillsState,
    ),
    SkillCategory(
      icon: Icons.storage_rounded,
      title: AppStrings.skillsDatabaseTitle,
      skills: AppStrings.skillsDatabase,
    ),
    SkillCategory(
      icon: Icons.cloud_sync_outlined,
      title: AppStrings.skillsApiTitle,
      skills: AppStrings.skillsApi,
    ),
    SkillCategory(
      icon: Icons.speed_rounded,
      title: AppStrings.skillsPerformanceTitle,
      skills: AppStrings.skillsPerformance,
    ),
    SkillCategory(
      icon: Icons.handyman_outlined,
      title: AppStrings.skillsToolsTitle,
      skills: AppStrings.skillsTools,
    ),
    SkillCategory(
      icon: Icons.rocket_launch_outlined,
      title: AppStrings.skillsDeploymentTitle,
      skills: AppStrings.skillsDeployment,
    ),
  ];

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
            vertical: AppDimensions.skillsSectionVerticalPadding,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              Center(child: SkillsHeader()),
              SizedBox(height: AppDimensions.skillsHeaderBottomGap),
              SkillsGrid(categories: categories),
            ],
          ),
        ),
      ),
    );
  }
}
