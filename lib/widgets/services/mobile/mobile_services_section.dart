import 'package:flutter/material.dart';

import '../../../utils/app_dimensions.dart';
import '../../../utils/app_durations.dart';
import '../../common/fade_slide_in.dart';
import '../desktop/service_card.dart';
import '../desktop/services_cta.dart';
import '../desktop/services_grid.dart';
import '../desktop/services_header.dart';
import '../desktop/services_section.dart';

/// The services section on phones: the same header, cards and closing CTA as
/// desktop, dropped to a single full-bleed column on the mobile measure.
///
/// With one column the cards simply follow reading order — which is also the
/// order the entrance stagger runs in, so the section unrolls top to bottom as
/// it scrolls in. The CTA stacks its copy above the button on its own, since
/// the phone column sits well below
/// [AppDimensions.servicesCtaStackBreakpoint].
///
/// Only the type scale, the card padding and the glyph square are stepped down;
/// everything else comes from the desktop widgets unchanged.
class MobileServicesSection extends StatelessWidget {
  const MobileServicesSection({super.key, required this.onContact});

  /// Fired by the closing CTA button.
  final VoidCallback onContact;

  @override
  Widget build(BuildContext context) {
    const services = ServicesSection.services;

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: AppDimensions.mobileServicesMaxWidth,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.mobileServicesHorizontalPadding,
            vertical: AppDimensions.mobileServicesSectionVerticalPadding,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Center(
                child: ServicesHeader(
                  titleFontSize: AppDimensions.mobileAboutTitleFontSize,
                  subtitleFontSize: AppDimensions.mobileAboutSubtitleFontSize,
                  maxWidth: AppDimensions.mobileServicesMaxWidth,
                ),
              ),
              const SizedBox(
                height: AppDimensions.mobileServicesHeaderBottomGap,
              ),

              ServicesGrid(
                services: services,
                gap: AppDimensions.mobileServicesGridGap,
                maxColumns: AppDimensions.mobileServicesMaxColumns,
                cardBuilder: (service, index) => ServiceCard(
                  service: service,
                  index: index,
                  titleFontSize:
                      AppDimensions.mobileServicesCardTitleFontSize,
                  bodyFontSize: AppDimensions.mobileServicesCardBodyFontSize,
                  featureFontSize: AppDimensions.mobileServicesFeatureFontSize,
                  padding: AppDimensions.mobileServicesCardPadding,
                  iconBoxSize: AppDimensions.mobileServicesCardIconBoxSize,
                  iconSize: AppDimensions.mobileServicesCardIconSize,
                  indexFontSize: AppDimensions.mobileServicesCardIndexFontSize,
                ),
              ),
              const SizedBox(height: AppDimensions.mobileServicesCtaTopGap),

              // The CTA closes the section, so it enters after every card.
              FadeSlideIn(
                delay: AppDurations.stagger * (4 + services.length),
                child: ServicesCta(
                  onContact: onContact,
                  titleFontSize: AppDimensions.mobileServicesCtaTitleFontSize,
                  bodyFontSize: AppDimensions.mobileServicesCtaBodyFontSize,
                  padding: AppDimensions.mobileServicesCtaPadding,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
