import 'package:flutter/material.dart';

import '../../../utils/app_dimensions.dart';
import '../desktop/about_content.dart';
import '../desktop/about_header.dart';
import '../desktop/about_illustration.dart';

/// The about section as it reads on tablets: the same header, illustration, and
/// content as desktop, but stacked into one centered column.
///
/// ```
///                     👋 ABOUT ME
///                Who I Am & What I Do
///        A passionate Flutter Developer focused on…
///
///              [ Developer Illustration ]
///
///                 [ About Content ]
/// ```
///
/// Desktop runs the illustration and the prose side by side. Splitting the
/// tablet measure the same way leaves the code window around 300px wide — too
/// narrow for the snippet to read, and narrow enough that the strengths grid
/// collapses to one column anyway. Stacking keeps the window at a comfortable
/// size and lets the grid stay 2-up.
///
/// Like the desktop section this widget is purely presentational — the owning
/// screen passes the actions down through callbacks.
class TabletAboutSection extends StatelessWidget {
  const TabletAboutSection({
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
          maxWidth: AppDimensions.tabletAboutMaxWidth,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.tabletHorizontalPadding,
            vertical: AppDimensions.tabletAboutSectionVerticalPadding,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Center(
                child: AboutHeader(
                  titleFontSize: AppDimensions.tabletAboutTitleFontSize,
                  subtitleFontSize: AppDimensions.tabletAboutSubtitleFontSize,
                  maxWidth: AppDimensions.tabletAboutHeaderMaxWidth,
                ),
              ),
              const SizedBox(
                height: AppDimensions.tabletAboutHeaderBottomGap,
              ),

              // Illustration first, so the section still opens on the visual.
              const Center(
                child: AboutIllustration(
                  maxWidth: AppDimensions.tabletAboutIllustrationMaxWidth,
                  padding: AppDimensions.tabletAboutIllustrationPadding,
                  codeFontSize: AppDimensions.tabletAboutCodeFontSize,
                  codePadding: AppDimensions.tabletAboutCodePadding,
                  codeLineHeight: AppDimensions.tabletAboutCodeLineHeight,
                ),
              ),
              const SizedBox(height: AppDimensions.tabletAboutStackGap),

              AboutContent(
                onViewProjects: onViewProjects,
                onDownloadCv: onDownloadCv,
                headlineFontSize: AppDimensions.tabletAboutHeadlineFontSize,
                bodyFontSize: AppDimensions.tabletAboutBodyFontSize,
                buttonHeight: AppDimensions.tabletButtonHeight,
                buttonHorizontalPadding:
                    AppDimensions.tabletButtonHorizontalPadding,
                buttonFontSize: AppDimensions.tabletButtonFontSize,
                buttonIconSize: AppDimensions.tabletButtonIconSize,
                statValueFontSize:
                    AppDimensions.tabletAboutStatValueFontSize,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
