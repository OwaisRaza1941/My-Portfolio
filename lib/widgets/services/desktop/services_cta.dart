import 'package:flutter/material.dart';

import '../../../utils/app_color.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/app_strings.dart';
import '../../../utils/text_style.dart';
import '../../buttons/primary_button.dart';

/// The closing panel of the services section: a short pitch on the left and the
/// "Let's Work Together" action on the right, wrapped in a softly glowing glass
/// band so the section ends on the same accent the cards hover into.
///
/// Below [AppDimensions.servicesCtaStackBreakpoint] the copy and the button
/// stack and center, which is what the tablet and mobile layouts get.
class ServicesCta extends StatelessWidget {
  const ServicesCta({
    super.key,
    required this.onContact,
    this.titleFontSize = AppDimensions.servicesCtaTitleFontSize,
    this.bodyFontSize = AppDimensions.servicesCtaBodyFontSize,
    this.padding = AppDimensions.servicesCtaPadding,
  });

  final VoidCallback onContact;

  final double titleFontSize;
  final double bodyFontSize;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isStacked =
            constraints.maxWidth < AppDimensions.servicesCtaStackBreakpoint;

        return Container(
          padding: EdgeInsets.all(padding),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDimensions.servicesCtaRadius),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                AppColors.primary.withValues(alpha: 0.16),
                AppColors.card.withValues(alpha: 0.55),
                AppColors.accent.withValues(alpha: 0.10),
              ],
            ),
            border: Border.all(
              color: AppColors.primary.withValues(alpha: 0.35),
              width: AppDimensions.borderThin,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.glow.withValues(alpha: 0.20),
                blurRadius: 36,
                offset: const Offset(0, 14),
              ),
            ],
          ),
          child: isStacked
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _CtaCopy(
                      align: TextAlign.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      titleFontSize: titleFontSize,
                      bodyFontSize: bodyFontSize,
                    ),
                    const SizedBox(height: AppDimensions.spaceLG),
                    PrimaryButton(
                      label: AppStrings.servicesCtaAction,
                      icon: Icons.arrow_forward_rounded,
                      onPressed: onContact,
                    ),
                  ],
                )
              : Row(
                  children: [
                    Expanded(
                      child: _CtaCopy(
                        align: TextAlign.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        titleFontSize: titleFontSize,
                        bodyFontSize: bodyFontSize,
                      ),
                    ),
                    const SizedBox(width: AppDimensions.spaceXL),
                    PrimaryButton(
                      label: AppStrings.servicesCtaAction,
                      icon: Icons.arrow_forward_rounded,
                      onPressed: onContact,
                    ),
                  ],
                ),
        );
      },
    );
  }
}

/// The CTA heading and its one-line follow-up, shared by both arrangements.
class _CtaCopy extends StatelessWidget {
  const _CtaCopy({
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
          AppStrings.servicesCtaTitle,
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
            AppStrings.servicesCtaBody,
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
