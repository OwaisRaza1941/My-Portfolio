import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../models/project_item.dart';
import '../../../utils/app_color.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/app_durations.dart';
import '../../../utils/app_strings.dart';
import '../../../utils/text_style.dart';
import '../../buttons/primary_button.dart';
import '../../buttons/secondary_button.dart';
import '../../common/hover_builder.dart';
import '../../skills/desktop/skill_chip.dart';
import 'project_zoom_view.dart';

/// One project rendered as a self-contained grid tile: a cropped screenshot up
/// top — tap it to zoom the full image over a blurred backdrop — then the
/// category, title, pitch, tech pills and link actions underneath.
///
/// The whole tile is one hover surface: it lifts slightly and its border warms
/// toward the brand blue, while the thumbnail itself scales up a touch further
/// to hint that it's the tappable part.
class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key, required this.project, required this.onOpenUrl});

  final ProjectItem project;

  /// Opens the repository / live build links.
  final ValueChanged<String> onOpenUrl;

  @override
  Widget build(BuildContext context) {
    return HoverBuilder(
      cursor: SystemMouseCursors.basic,
      builder: (context, isHovered) {
        return AnimatedContainer(
          duration: AppDurations.medium,
          curve: Curves.easeOut,
          clipBehavior: Clip.antiAlias,
          transform: Matrix4.translationValues(
            0,
            isHovered ? -AppDimensions.projectCardHoverLift : 0,
            0,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              AppDimensions.projectCardRadius,
            ),
            color: AppColors.card.withValues(alpha: isHovered ? 0.85 : 0.6),
            border: Border.all(
              color: isHovered
                  ? AppColors.primaryLight.withValues(alpha: 0.7)
                  : AppColors.border,
              width: AppDimensions.borderThin,
            ),
            boxShadow: isHovered
                ? [
                    BoxShadow(
                      color: AppColors.glow.withValues(alpha: 0.35),
                      blurRadius: 28,
                      offset: const Offset(0, 14),
                    ),
                  ]
                : const [],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _CardImage(project: project, isHovered: isHovered),
              Padding(
                padding: const EdgeInsets.all(AppDimensions.projectCardPadding),
                child: _CardBody(project: project, onOpenUrl: onOpenUrl),
              ),
            ],
          ),
        );
      },
    );
  }
}

/// The cropped thumbnail: a category pill, a zoom hint badge that fades in on
/// hover, and a tap target that opens the full screenshot over a blurred
/// backdrop. The same tap works from a mouse click or a touch tap.
class _CardImage extends StatelessWidget {
  const _CardImage({required this.project, required this.isHovered});

  final ProjectItem project;
  final bool isHovered;

  @override
  Widget build(BuildContext context) {
    final aspectRatio = project.type == ProjectType.mobileApp
        ? AppDimensions.projectCardImageAppAspectRatio
        : AppDimensions.projectCardImageWebsiteAspectRatio;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => showProjectImageZoom(
          context,
          images: project.screenshots.isNotEmpty
              ? project.screenshots
              : [project.imageAsset],
        ),
        child: AspectRatio(
          aspectRatio: aspectRatio,
          child: Stack(
            fit: StackFit.expand,
            children: [
              AnimatedScale(
                scale: isHovered
                    ? AppDimensions.projectCardImageHoverScale
                    : 1.0,
                duration: AppDurations.medium,
                curve: Curves.easeOut,
                child: Image.asset(
                  project.imageAsset,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                  filterQuality: FilterQuality.medium,
                  errorBuilder: (context, error, stackTrace) =>
                      _ImagePlaceholder(category: project.category),
                ),
              ),
              Positioned(
                top: AppDimensions.spaceMD,
                left: AppDimensions.spaceMD,
                child: _CategoryPill(label: project.category),
              ),
              Positioned(
                right: AppDimensions.spaceMD,
                bottom: AppDimensions.spaceMD,
                child: AnimatedOpacity(
                  opacity: isHovered ? 1 : 0,
                  duration: AppDurations.fast,
                  child: const _ZoomBadge(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// The domain label pinned over the top-left corner of the thumbnail.
class _CategoryPill extends StatelessWidget {
  const _CategoryPill({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.spaceSM + 2,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimensions.radiusPill),
        color: AppColors.scaffoldBackground.withValues(alpha: 0.72),
        border: Border.all(
          color: AppColors.border.withValues(alpha: 0.8),
          width: AppDimensions.borderThin,
        ),
      ),
      child: Text(
        label.toUpperCase(),
        style: AppTextStyle.withColor(
          AppTextStyle.labelMedium,
          AppColors.textSecondary,
        ).copyWith(
          fontSize: AppDimensions.projectCardCategoryFontSize,
          letterSpacing: 1.5,
        ),
      ),
    );
  }
}

/// The small circular "tap to zoom" hint over the thumbnail's corner.
class _ZoomBadge extends StatelessWidget {
  const _ZoomBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34,
      height: 34,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.scaffoldBackground.withValues(alpha: 0.75),
        border: Border.all(
          color: AppColors.border.withValues(alpha: 0.8),
          width: AppDimensions.borderThin,
        ),
      ),
      child: const Icon(
        Icons.zoom_in_rounded,
        color: AppColors.textPrimary,
        size: 18,
      ),
    );
  }
}

/// Shown in place of a screenshot that hasn't been added to `assets/images/`
/// yet, so a missing file reads as "coming soon" rather than a broken image.
class _ImagePlaceholder extends StatelessWidget {
  const _ImagePlaceholder({required this.category});

  final String category;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.surface, AppColors.card],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.image_outlined,
              color: AppColors.textDisabled,
              size: 34,
            ),
            const SizedBox(height: AppDimensions.spaceSM),
            Text(
              category,
              style: AppTextStyle.withColor(
                AppTextStyle.bodySmall,
                AppColors.textDisabled,
              ).copyWith(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

/// The copy under the thumbnail: title, pitch, tech pills and link actions.
class _CardBody extends StatelessWidget {
  const _CardBody({required this.project, required this.onOpenUrl});

  final ProjectItem project;
  final ValueChanged<String> onOpenUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          project.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyle.h1.copyWith(
            fontSize: AppDimensions.projectCardTitleFontSize,
            fontWeight: FontWeight.w700,
            height: 1.25,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: AppDimensions.projectCardCategoryGap),

        Text(
          project.description,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyle.withColor(
            AppTextStyle.bodyMedium,
            AppColors.textTertiary,
          ).copyWith(fontSize: AppDimensions.projectCardBodyFontSize, height: 1.6),
        ),
        const SizedBox(height: AppDimensions.projectCardContentGap),

        Wrap(
          spacing: AppDimensions.skillsChipSpacing,
          runSpacing: AppDimensions.skillsChipRunSpacing,
          children: [
            for (final tech in project.tech.take(3))
              SkillChip(
                label: tech,
                fontSize: AppDimensions.projectCardChipFontSize,
              ),
          ],
        ),
        const SizedBox(height: AppDimensions.projectCardContentGap),

        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            PrimaryButton(
              label: AppStrings.projectViewCode,
              iconWidget: FaIcon(
                FontAwesomeIcons.github,
                size: AppDimensions.projectCardActionIconSize,
                color: AppColors.buttonText,
              ),
              height: AppDimensions.projectCardActionButtonHeight,
              horizontalPadding: AppDimensions.projectCardActionHorizontalPadding,
              fontSize: AppDimensions.projectCardActionFontSize,
              onPressed: () => onOpenUrl(project.repoUrl),
            ),
            if (project.liveUrl != null) ...[
              const SizedBox(width: AppDimensions.projectCardActionGap),
              SecondaryButton(
                label: AppStrings.projectLiveDemo,
                icon: Icons.open_in_new_rounded,
                height: AppDimensions.projectCardActionButtonHeight,
                horizontalPadding: AppDimensions.projectCardActionHorizontalPadding,
                iconSize: AppDimensions.projectCardActionIconSize,
                fontSize: AppDimensions.projectCardActionFontSize,
                onPressed: () => onOpenUrl(project.liveUrl!),
              ),
            ],
          ],
        ),
      ],
    );
  }
}
