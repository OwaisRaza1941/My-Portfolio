import 'package:flutter/material.dart';

import '../../../utils/app_dimensions.dart';
import '../desktop/skill_category_card.dart';
import '../desktop/skills_grid.dart';
import '../desktop/skills_header.dart';
import '../desktop/skills_section.dart';

/// The skills section on phones: the same header and cards as desktop, dropped
/// to a single full-bleed column on the mobile measure.
///
/// With one column the grid's masonry balancing has nothing to balance, so the
/// cards simply follow reading order — which is also the order the entrance
/// stagger runs in, so the section unrolls top to bottom as it scrolls in.
///
/// Only the type scale, the card padding and the glyph square are stepped down;
/// everything else comes from the desktop widgets unchanged.
class MobileSkillsSection extends StatelessWidget {
  const MobileSkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: AppDimensions.mobileSkillsMaxWidth,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.mobileSkillsHorizontalPadding,
            vertical: AppDimensions.mobileSkillsSectionVerticalPadding,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Center(
                child: SkillsHeader(
                  titleFontSize: AppDimensions.mobileAboutTitleFontSize,
                  subtitleFontSize: AppDimensions.mobileAboutSubtitleFontSize,
                  maxWidth: AppDimensions.mobileSkillsMaxWidth,
                ),
              ),
              const SizedBox(
                height: AppDimensions.mobileSkillsHeaderBottomGap,
              ),

              SkillsGrid(
                categories: SkillsSection.categories,
                gap: AppDimensions.mobileSkillsGridGap,
                maxColumns: AppDimensions.mobileSkillsMaxColumns,
                cardBuilder: (category) => SkillCategoryCard(
                  category: category,
                  titleFontSize: AppDimensions.mobileSkillsCardTitleFontSize,
                  chipFontSize: AppDimensions.mobileSkillsChipFontSize,
                  padding: AppDimensions.mobileSkillsCardPadding,
                  iconBoxSize: AppDimensions.mobileSkillsCardIconBoxSize,
                  iconSize: AppDimensions.mobileSkillsCardIconSize,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
