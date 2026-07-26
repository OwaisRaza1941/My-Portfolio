import 'package:flutter/material.dart';

import '../../../models/contact_detail.dart';
import '../../../utils/app_color.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/app_strings.dart';
import '../../../utils/text_style.dart';
import '../../hero/desktop/social_icons.dart';

/// The left column of the contact section: a short headline, the direct contact
/// details, and the same social row the hero opens with — so the page closes on
/// the channels it opened with.
class ContactInfoPanel extends StatelessWidget {
  const ContactInfoPanel({
    super.key,
    required this.details,
    required this.onOpenUrl,
    required this.tileBuilder,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.textAlign = TextAlign.start,
    this.headlineFontSize = AppDimensions.contactInfoHeadlineFontSize,
    this.bodyFontSize = AppDimensions.contactInfoBodyFontSize,
    this.tileGap = AppDimensions.contactInfoTileGap,
  });

  /// The rows to render, in order.
  final List<ContactDetail> details;

  /// Opens a link (a detail's URL or a social profile).
  final ValueChanged<String> onOpenUrl;

  /// Builds one detail row. Injected so the tablet and mobile layouts can pass
  /// their own tile sizing without this panel knowing about breakpoints.
  final Widget Function(ContactDetail detail) tileBuilder;

  /// Left-aligned side by side with the form; centered once stacked.
  final CrossAxisAlignment crossAxisAlignment;
  final TextAlign textAlign;

  final double headlineFontSize;
  final double bodyFontSize;
  final double tileGap;

  @override
  Widget build(BuildContext context) {
    final isCentered = crossAxisAlignment == CrossAxisAlignment.center;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(
          AppStrings.contactInfoHeadline,
          textAlign: textAlign,
          style: AppTextStyle.withColor(
            AppTextStyle.h2,
            AppColors.textPrimary,
          ).copyWith(fontSize: headlineFontSize, height: 1.3),
        ),
        const SizedBox(height: AppDimensions.spaceSM + 2),

        ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: AppDimensions.contactInfoBodyMaxWidth,
          ),
          child: Text(
            AppStrings.contactInfoBody,
            textAlign: textAlign,
            style: AppTextStyle.withColor(
              AppTextStyle.bodyMedium,
              AppColors.textTertiary,
            ).copyWith(fontSize: bodyFontSize, height: 1.7),
          ),
        ),
        const SizedBox(height: AppDimensions.spaceXL),

        for (var i = 0; i < details.length; i++) ...[
          if (i > 0) SizedBox(height: tileGap),
          tileBuilder(details[i]),
        ],

        const SizedBox(height: AppDimensions.contactSocialsTopGap),

        Text(
          AppStrings.contactFollowLabel.toUpperCase(),
          textAlign: textAlign,
          style: AppTextStyle.withColor(
            AppTextStyle.labelMedium,
            AppColors.textTertiary,
          ).copyWith(
            fontSize: AppDimensions.contactInfoLabelFontSize,
            letterSpacing: 1.6,
          ),
        ),
        const SizedBox(height: AppDimensions.spaceMD),

        // The icon row carries a trailing gap after its last item, so centering
        // it needs the row itself rather than the column's alignment.
        Align(
          alignment: isCentered ? Alignment.center : Alignment.centerLeft,
          child: SocialIcons(onOpen: onOpenUrl),
        ),
      ],
    );
  }
}
