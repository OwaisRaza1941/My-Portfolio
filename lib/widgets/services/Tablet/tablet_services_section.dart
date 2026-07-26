import 'package:flutter/material.dart';

import '../../../utils/app_dimensions.dart';
import '../../../utils/app_durations.dart';
import '../../common/fade_slide_in.dart';
import '../desktop/service_card.dart';
import '../desktop/services_cta.dart';
import '../desktop/services_grid.dart';
import '../desktop/services_header.dart';
import '../desktop/services_section.dart';

/// The services section on tablets: the same header, cards and closing CTA as
/// desktop, stepped down to two columns on the tablet measure.
///
/// ```
///                     🛠️ WHAT I DO
///                   Services I Offer
///        End-to-end Flutter development, from Figma…
///
///        [ Mobile Apps   ]   [ Websites      ]
///        [ Cross-Platform]   [ UI/UX         ]
///        [ Firebase      ]   [ API           ]
///
///        [ Have a project in mind?   (Let's Work…) ]
/// ```
///
/// Three columns on a 700pt column would leave each card near 210pt wide, where
/// every deliverable line wraps twice. Two columns keep the pitch and the
/// checklist readable while the grid still reads as a grid.
///
/// Purely presentational, like the desktop section — the service list stays in
/// [ServicesSection] and the contact action comes down from the owning screen.
class TabletServicesSection extends StatelessWidget {
  const TabletServicesSection({super.key, required this.onContact});

  /// Fired by the closing CTA button.
  final VoidCallback onContact;

  @override
  Widget build(BuildContext context) {
    const services = ServicesSection.services;

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: AppDimensions.tabletServicesMaxWidth,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.tabletHorizontalPadding,
            vertical: AppDimensions.tabletServicesSectionVerticalPadding,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Center(
                child: ServicesHeader(
                  titleFontSize: AppDimensions.tabletAboutTitleFontSize,
                  subtitleFontSize: AppDimensions.tabletAboutSubtitleFontSize,
                  maxWidth: AppDimensions.tabletServicesHeaderMaxWidth,
                ),
              ),
              const SizedBox(
                height: AppDimensions.tabletServicesHeaderBottomGap,
              ),

              ServicesGrid(
                services: services,
                gap: AppDimensions.tabletServicesGridGap,
                minCardWidth: AppDimensions.tabletServicesMinCardWidth,
                maxColumns: AppDimensions.tabletServicesMaxColumns,
                cardBuilder: (service, index) => ServiceCard(
                  service: service,
                  index: index,
                  titleFontSize:
                      AppDimensions.tabletServicesCardTitleFontSize,
                  bodyFontSize: AppDimensions.tabletServicesCardBodyFontSize,
                  featureFontSize: AppDimensions.tabletServicesFeatureFontSize,
                  padding: AppDimensions.tabletServicesCardPadding,
                  iconBoxSize: AppDimensions.tabletServicesCardIconBoxSize,
                  iconSize: AppDimensions.tabletServicesCardIconSize,
                  indexFontSize: AppDimensions.tabletServicesCardIndexFontSize,
                ),
              ),
              const SizedBox(height: AppDimensions.tabletServicesCtaTopGap),

              // The CTA closes the section, so it enters after every card.
              FadeSlideIn(
                delay: AppDurations.stagger * (4 + services.length),
                child: ServicesCta(
                  onContact: onContact,
                  titleFontSize: AppDimensions.tabletServicesCtaTitleFontSize,
                  bodyFontSize: AppDimensions.tabletServicesCtaBodyFontSize,
                  padding: AppDimensions.tabletServicesCtaPadding,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
