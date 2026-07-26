import 'package:flutter/material.dart';

import '../../../models/service_item.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/app_durations.dart';
import '../../../utils/app_strings.dart';
import '../../common/fade_slide_in.dart';
import 'services_cta.dart';
import 'services_grid.dart';
import 'services_header.dart';

/// The full desktop services section: a centered header over a 3-up grid of
/// service cards, closed by a "have a project in mind?" panel.
///
/// ```
///                       🛠️ WHAT I DO
///                      Services I Offer
///        End-to-end Flutter development, from Figma to store…
///
///   [ Mobile Apps ]  [ Websites   ]  [ Cross-Platform ]
///   [ UI/UX       ]  [ Firebase   ]  [ API            ]
///
///   [ Have a project in mind?        (Let's Work Together) ]
/// ```
///
/// Purely presentational, like the hero, about and skills sections — the copy
/// lives in [AppStrings], the layout constants in [AppDimensions], and the
/// contact action comes down from the owning screen.
class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key, required this.onContact});

  /// Fired by the closing CTA button.
  final VoidCallback onContact;

  /// Every service, in reading order — which is also the grid order and the
  /// order the "01…06" watermarks follow.
  static const List<ServiceItem> services = [
    ServiceItem(
      icon: Icons.phone_iphone_rounded,
      title: AppStrings.serviceMobileTitle,
      description: AppStrings.serviceMobileBody,
      features: AppStrings.serviceMobileFeatures,
    ),
    ServiceItem(
      icon: Icons.public_rounded,
      title: AppStrings.serviceWebTitle,
      description: AppStrings.serviceWebBody,
      features: AppStrings.serviceWebFeatures,
    ),
    ServiceItem(
      icon: Icons.devices_rounded,
      title: AppStrings.serviceCrossPlatformTitle,
      description: AppStrings.serviceCrossPlatformBody,
      features: AppStrings.serviceCrossPlatformFeatures,
    ),
    ServiceItem(
      icon: Icons.brush_rounded,
      title: AppStrings.serviceUiUxTitle,
      description: AppStrings.serviceUiUxBody,
      features: AppStrings.serviceUiUxFeatures,
    ),
    ServiceItem(
      icon: Icons.local_fire_department_rounded,
      title: AppStrings.serviceFirebaseTitle,
      description: AppStrings.serviceFirebaseBody,
      features: AppStrings.serviceFirebaseFeatures,
    ),
    ServiceItem(
      icon: Icons.api_rounded,
      title: AppStrings.serviceApiTitle,
      description: AppStrings.serviceApiBody,
      features: AppStrings.serviceApiFeatures,
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
            vertical: AppDimensions.servicesSectionVerticalPadding,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Center(child: ServicesHeader()),
              const SizedBox(height: AppDimensions.servicesHeaderBottomGap),
              const ServicesGrid(services: services),
              const SizedBox(height: AppDimensions.servicesCtaTopGap),

              // The CTA closes the section, so it enters after every card.
              FadeSlideIn(
                delay: AppDurations.stagger * (4 + services.length),
                child: ServicesCta(onContact: onContact),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
