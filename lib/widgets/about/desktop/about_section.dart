import 'package:flutter/material.dart';

import '../../../utils/app_dimensions.dart';
import 'about_content.dart';
import 'about_header.dart';
import 'about_illustration.dart';

/// The full desktop about section: a centered header, then the developer
/// illustration on the left and the about content on the right.
///
/// ```
///                        👋 ABOUT ME
///                   Who I Am & What I Do
///        A passionate Flutter Developer focused on building
///        modern, scalable and high-performance applications.
///
///   [ Developer Illustration ]      [ About Content ]
/// ```
///
/// Like the hero section this widget is purely presentational — the owning
/// screen passes the actions down through callbacks.
class AboutSection extends StatelessWidget {
  const AboutSection({
    super.key,
    required this.onViewProjects,
    required this.onDownloadCv,
  });

  final VoidCallback onViewProjects;
  final VoidCallback onDownloadCv;

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
            vertical: AppDimensions.aboutSectionVerticalPadding,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Center(child: AboutHeader()),
              const SizedBox(height: AppDimensions.aboutHeaderBottomGap),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Even split: the illustration needs room for its overhanging
                  // badges, and the prose column reads best at a similar width.
                  const Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: AboutIllustration(),
                    ),
                  ),
                  const SizedBox(width: AppDimensions.aboutColumnGap),
                  Expanded(
                    child: AboutContent(
                      onViewProjects: onViewProjects,
                      onDownloadCv: onDownloadCv,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
