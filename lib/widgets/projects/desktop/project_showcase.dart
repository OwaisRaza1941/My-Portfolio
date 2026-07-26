import 'package:flutter/material.dart';

import '../../../models/project_item.dart';
import '../../../utils/app_color.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/app_durations.dart';
import '../../../utils/app_strings.dart';
import '../../../utils/text_style.dart';
import '../../buttons/primary_button.dart';
import '../../buttons/secondary_button.dart';
import '../../common/hover_builder.dart';
import '../../services/desktop/service_feature_row.dart';
import '../../skills/desktop/skill_chip.dart';
import 'project_preview.dart';

/// One project presented as a full-width showcase row: the framed screenshot on
/// one side, the copy and actions on the other.
///
/// Rows alternate sides down the section ([isReversed]), which keeps four tall
/// portrait screenshots from marching down a single column. The whole row is
/// one hover surface — the frame lifts, the title warms toward the brand blue
/// and the feature checks light up together.
///
/// Below [AppDimensions.projectsStackBreakpoint] the row stacks the preview
/// above the copy instead of squeezing the paragraph.
class ProjectShowcase extends StatelessWidget {
  const ProjectShowcase({
    super.key,
    required this.project,
    required this.index,
    required this.onOpenUrl,
  });

  final ProjectItem project;

  /// Zero-based position in the section, shown as the "01" label and used to
  /// decide which side the preview sits on.
  final int index;

  /// Opens the repository / live build links.
  final ValueChanged<String> onOpenUrl;

  /// Odd rows mirror the layout, putting the preview on the right.
  bool get isReversed => index.isOdd;

  /// The label reads "01", "02", … rather than "1", "2".
  String get _label => (index + 1).toString().padLeft(2, '0');

  @override
  Widget build(BuildContext context) {
    return HoverBuilder(
      cursor: SystemMouseCursors.basic,
      builder: (context, isHovered) {
        return LayoutBuilder(
          builder: (context, constraints) {
            final isStacked =
                constraints.maxWidth < AppDimensions.projectsStackBreakpoint;

            final preview = ProjectPreview(
              imageAsset: project.imageAsset,
              isHovered: isHovered,
            );

            final content = _ProjectContent(
              project: project,
              label: _label,
              isHovered: isHovered,
              onOpenUrl: onOpenUrl,
            );

            if (isStacked) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: preview),
                  const SizedBox(height: AppDimensions.projectsColumnGap),
                  content,
                ],
              );
            }

            final columns = <Widget>[
              preview,
              const SizedBox(width: AppDimensions.projectsColumnGap),
              Expanded(
                child: Align(
                  // The copy hugs the frame rather than drifting to the far
                  // page edge on wide monitors.
                  alignment: isReversed
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: AppDimensions.projectContentMaxWidth,
                    ),
                    child: content,
                  ),
                ),
              ),
            ];

            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: isReversed ? columns.reversed.toList() : columns,
            );
          },
        );
      },
    );
  }
}

/// The copy column: index + category, title, pitch, deliverables, tech pills
/// and the link actions.
class _ProjectContent extends StatelessWidget {
  const _ProjectContent({
    required this.project,
    required this.label,
    required this.isHovered,
    required this.onOpenUrl,
  });

  final ProjectItem project;
  final String label;
  final bool isHovered;
  final ValueChanged<String> onOpenUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _MetaRow(
          label: label,
          category: project.category,
          isHovered: isHovered,
        ),
        const SizedBox(height: AppDimensions.projectCategoryGap),

        AnimatedDefaultTextStyle(
          duration: AppDurations.fast,
          curve: Curves.easeOut,
          style: AppTextStyle.h1.copyWith(
            fontSize: AppDimensions.projectTitleFontSize,
            fontWeight: FontWeight.w700,
            height: 1.2,
            color: isHovered ? AppColors.accentGlow : AppColors.textPrimary,
          ),
          child: Text(project.title),
        ),
        const SizedBox(height: AppDimensions.spaceMD),

        Text(
          project.description,
          style: AppTextStyle.withColor(
            AppTextStyle.bodyMedium,
            AppColors.textTertiary,
          ).copyWith(
            fontSize: AppDimensions.projectBodyFontSize,
            height: 1.7,
          ),
        ),
        const SizedBox(height: AppDimensions.projectContentGap),

        for (var i = 0; i < project.features.length; i++) ...[
          if (i > 0) const SizedBox(height: AppDimensions.serviceFeatureRowGap),
          ServiceFeatureRow(
            label: project.features[i],
            isCardHovered: isHovered,
            fontSize: AppDimensions.projectFeatureFontSize,
          ),
        ],
        const SizedBox(height: AppDimensions.projectContentGap),

        Wrap(
          spacing: AppDimensions.skillsChipSpacing,
          runSpacing: AppDimensions.skillsChipRunSpacing,
          children: [
            for (final tech in project.tech)
              SkillChip(
                label: tech,
                isCardHovered: isHovered,
                fontSize: AppDimensions.projectChipFontSize,
              ),
          ],
        ),
        const SizedBox(height: AppDimensions.projectContentGap),

        Wrap(
          spacing: AppDimensions.projectActionGap,
          runSpacing: AppDimensions.projectActionGap,
          children: [
            PrimaryButton(
              label: AppStrings.projectViewCode,
              icon: Icons.code_rounded,
              height: AppDimensions.projectActionButtonHeight,
              fontSize: AppDimensions.projectActionFontSize,
              onPressed: () => onOpenUrl(project.repoUrl),
            ),
            if (project.liveUrl != null)
              SecondaryButton(
                label: AppStrings.projectLiveDemo,
                icon: Icons.open_in_new_rounded,
                height: AppDimensions.projectActionButtonHeight,
                fontSize: AppDimensions.projectActionFontSize,
                onPressed: () => onOpenUrl(project.liveUrl!),
              ),
          ],
        ),
      ],
    );
  }
}

/// The "01 —— E-COMMERCE" line that opens the copy column: the project number,
/// a short accent rule that extends on hover, and the domain label.
class _MetaRow extends StatelessWidget {
  const _MetaRow({
    required this.label,
    required this.category,
    required this.isHovered,
  });

  final String label;
  final String category;
  final bool isHovered;

  @override
  Widget build(BuildContext context) {
    final accent = isHovered ? AppColors.accentGlow : AppColors.primaryLight;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: AppTextStyle.withColor(
            AppTextStyle.labelMedium,
            accent,
          ).copyWith(
            fontSize: AppDimensions.projectIndexFontSize,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(width: AppDimensions.spaceSM + 2),

        AnimatedContainer(
          duration: AppDurations.medium,
          curve: Curves.easeOutCubic,
          width: isHovered ? 44.0 : 26.0,
          height: AppDimensions.borderThin,
          color: accent.withValues(alpha: isHovered ? 0.9 : 0.5),
        ),
        const SizedBox(width: AppDimensions.spaceSM + 2),

        Text(
          category.toUpperCase(),
          style: AppTextStyle.withColor(
            AppTextStyle.labelMedium,
            AppColors.textTertiary,
          ).copyWith(
            fontSize: AppDimensions.projectIndexFontSize,
            letterSpacing: 2.5,
          ),
        ),
      ],
    );
  }
}
