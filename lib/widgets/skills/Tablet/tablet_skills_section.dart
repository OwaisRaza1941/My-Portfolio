import 'package:flutter/material.dart';

import '../../../utils/app_dimensions.dart';
import '../desktop/skill_category_card.dart';
import '../desktop/skills_grid.dart';
import '../desktop/skills_header.dart';
import '../desktop/skills_section.dart';

/// The skills section on tablets: the same header and masonry grid as desktop,
/// stepped down to two columns on the tablet measure.
///
/// ```
///                     ⚡ MY SKILLS
///               Technologies I Work With
///        The tools, frameworks and practices I use…
///
///          [ Languages  ]   [ Mobile Dev ]
///          [ Database   ]   [ API        ]
/// ```
///
/// Three columns on a 700pt column would leave each card near 210pt wide, where
/// even "Firebase Realtime Database" needs three lines. Two columns keep the
/// chips readable and the masonry balance intact.
///
/// Purely presentational, like the desktop section — the category list and the
/// distribution logic both stay where they already live.
class TabletSkillsSection extends StatelessWidget {
  const TabletSkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: AppDimensions.tabletSkillsMaxWidth,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.tabletHorizontalPadding,
            vertical: AppDimensions.tabletSkillsSectionVerticalPadding,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Center(
                child: SkillsHeader(
                  titleFontSize: AppDimensions.tabletAboutTitleFontSize,
                  subtitleFontSize: AppDimensions.tabletAboutSubtitleFontSize,
                  maxWidth: AppDimensions.tabletSkillsHeaderMaxWidth,
                ),
              ),
              const SizedBox(
                height: AppDimensions.tabletSkillsHeaderBottomGap,
              ),

              SkillsGrid(
                categories: SkillsSection.categories,
                gap: AppDimensions.tabletSkillsGridGap,
                minCardWidth: AppDimensions.tabletSkillsMinCardWidth,
                maxColumns: AppDimensions.tabletSkillsMaxColumns,
                cardBuilder: (category) => SkillCategoryCard(
                  category: category,
                  titleFontSize: AppDimensions.tabletSkillsCardTitleFontSize,
                  chipFontSize: AppDimensions.tabletSkillsChipFontSize,
                  padding: AppDimensions.tabletSkillsCardPadding,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
