import 'package:flutter/material.dart';

import '../../../utils/app_color.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/app_strings.dart';
import '../../../utils/text_style.dart';
import '../../buttons/secondary_button.dart';

/// The closing panel of the projects section: a short "there's more on GitHub"
/// note on the left and the browse action on the right.
///
/// It deliberately uses the outlined button rather than the solid one — the
/// services CTA further up the page owns the primary ask, and two solid pills
/// competing on one page would flatten that hierarchy.
class ProjectsFooter extends StatelessWidget {
  const ProjectsFooter({
    super.key,
    required this.onBrowseAll,
    this.titleFontSize = AppDimensions.projectsFooterTitleFontSize,
    this.bodyFontSize = AppDimensions.projectsFooterBodyFontSize,
    this.padding = AppDimensions.projectsFooterPadding,
  });

  final VoidCallback onBrowseAll;

  final double titleFontSize;
  final double bodyFontSize;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isStacked =
            constraints.maxWidth < AppDimensions.servicesCtaStackBreakpoint;

        final action = SecondaryButton(
          label: AppStrings.projectsFooterAction,
          icon: Icons.open_in_new_rounded,
          onPressed: onBrowseAll,
        );

        return Container(
          padding: EdgeInsets.all(padding),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDimensions.servicesCtaRadius),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                AppColors.card.withValues(alpha: 0.60),
                AppColors.surface.withValues(alpha: 0.45),
              ],
            ),
            border: Border.all(
              color: AppColors.border.withValues(alpha: 0.9),
              width: AppDimensions.borderThin,
            ),
          ),
          child: isStacked
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _FooterCopy(
                      align: TextAlign.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      titleFontSize: titleFontSize,
                      bodyFontSize: bodyFontSize,
                    ),
                    const SizedBox(height: AppDimensions.spaceLG),
                    action,
                  ],
                )
              : Row(
                  children: [
                    Expanded(
                      child: _FooterCopy(
                        align: TextAlign.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        titleFontSize: titleFontSize,
                        bodyFontSize: bodyFontSize,
                      ),
                    ),
                    const SizedBox(width: AppDimensions.spaceXL),
                    action,
                  ],
                ),
        );
      },
    );
  }
}

/// The panel heading and its one-line follow-up, shared by both arrangements.
class _FooterCopy extends StatelessWidget {
  const _FooterCopy({
    required this.align,
    required this.crossAxisAlignment,
    required this.titleFontSize,
    required this.bodyFontSize,
  });

  final TextAlign align;
  final CrossAxisAlignment crossAxisAlignment;
  final double titleFontSize;
  final double bodyFontSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(
          AppStrings.projectsFooterTitle,
          textAlign: align,
          style: AppTextStyle.withColor(
            AppTextStyle.h2,
            AppColors.textPrimary,
          ).copyWith(fontSize: titleFontSize, height: 1.3),
        ),
        const SizedBox(height: AppDimensions.spaceSM + 2),
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: AppDimensions.servicesCtaTextMaxWidth,
          ),
          child: Text(
            AppStrings.projectsFooterBody,
            textAlign: align,
            style: AppTextStyle.withColor(
              AppTextStyle.bodyMedium,
              AppColors.textTertiary,
            ).copyWith(fontSize: bodyFontSize, height: 1.6),
          ),
        ),
      ],
    );
  }
}
