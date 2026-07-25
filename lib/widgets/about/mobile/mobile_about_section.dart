import 'package:flutter/material.dart';
import '../../../utils/app_dimensions.dart';
import '../desktop/about_content.dart';
import '../desktop/about_header.dart';
import '../desktop/about_illustration.dart';

/// The about section on phones: header, illustration, and content stacked into
/// a single full-bleed column on the same measure as the mobile hero, so both
/// sections share one column edge down the page.
///
/// Everything below the header comes from the desktop widgets — only the type
/// scale, the code-window metrics, and the stat gutter are stepped down. The
/// strengths grid collapses to one column on its own once its tiles get too
/// narrow, so it needs no override here.
class MobileAboutSection extends StatelessWidget {
  const MobileAboutSection({
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
          maxWidth: AppDimensions.mobileAboutMaxWidth,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.mobileAboutHorizontalPadding,
            vertical: AppDimensions.mobileAboutSectionVerticalPadding,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Center(
                child: AboutHeader(
                  titleFontSize: AppDimensions.mobileAboutTitleFontSize,
                  subtitleFontSize: AppDimensions.mobileAboutSubtitleFontSize,
                  maxWidth: AppDimensions.mobileAboutMaxWidth,
                ),
              ),
              const SizedBox(
                height: AppDimensions.mobileAboutHeaderBottomGap,
              ),

              const Center(
                child: AboutIllustration(
                  maxWidth: AppDimensions.mobileAboutIllustrationMaxWidth,
                  padding: AppDimensions.mobileAboutIllustrationPadding,
                  codeFontSize: AppDimensions.mobileAboutCodeFontSize,
                  codePadding: AppDimensions.mobileAboutCodePadding,
                  codeLineHeight: AppDimensions.mobileAboutCodeLineHeight,
                  codeGutterWidth:
                      AppDimensions.mobileAboutCodeGutterWidth,
                  codeGutterGap: AppDimensions.mobileAboutCodeGutterGap,
                ),
              ),
              const SizedBox(height: AppDimensions.mobileAboutStackGap),

              AboutContent(
                onViewProjects: onViewProjects,
                onDownloadCv: onDownloadCv,
                headlineFontSize: AppDimensions.mobileAboutHeadlineFontSize,
                bodyFontSize: AppDimensions.mobileAboutBodyFontSize,
                buttonHeight: AppDimensions.mobileButtonHeight,
                buttonHorizontalPadding:
                    AppDimensions.mobileButtonHorizontalPadding,
                buttonFontSize: AppDimensions.mobileButtonFontSize,
                buttonIconSize: AppDimensions.mobileButtonIconSize,
                statValueFontSize:
                    AppDimensions.mobileAboutStatValueFontSize,
                statLabelFontSize:
                    AppDimensions.mobileAboutStatLabelFontSize,
                statGap: AppDimensions.mobileAboutStatGap,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
