import 'package:flutter/material.dart';

import '../../../models/about_highlight.dart';
import '../../../utils/app_color.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/app_durations.dart';
import '../../../utils/app_strings.dart';
import '../../../utils/text_style.dart';
import '../../buttons/primary_button.dart';
import '../../buttons/secondary_button.dart';
import '../../common/fade_slide_in.dart';
import '../../common/gradient_text.dart';
import 'about_highlight_tile.dart';
import 'about_stats.dart';

/// The right column of the about section: a gradient headline, two paragraphs of
/// prose, a 2-up grid of strengths, the headline numbers, and the section's
/// call-to-action pair.
///
/// Purely presentational — the owning screen supplies the actions.
class AboutContent extends StatelessWidget {
  const AboutContent({
    super.key,
    required this.onViewProjects,
    required this.onDownloadCv,
    this.headlineFontSize = AppDimensions.aboutHeadlineFontSize,
    this.bodyFontSize = AppDimensions.aboutBodyFontSize,
    this.buttonHeight = AppDimensions.buttonHeight,
    this.buttonHorizontalPadding = AppDimensions.buttonHorizontalPadding,
    this.buttonFontSize,
    this.buttonIconSize,
    this.statValueFontSize,
    this.statLabelFontSize = AppDimensions.aboutStatLabelFontSize,
    this.statGap = AppDimensions.aboutStatGap,
  });

  final VoidCallback onViewProjects;
  final VoidCallback onDownloadCv;

  // Typography and button overrides so compact layouts can reuse this column
  // without duplicating it.
  final double headlineFontSize;
  final double bodyFontSize;
  final double buttonHeight;
  final double buttonHorizontalPadding;
  final double? buttonFontSize;
  final double? buttonIconSize;

  // Headline-number overrides — the desktop stat strip needs both a smaller
  // figure and a much tighter gutter before it fits a phone.
  final double? statValueFontSize;
  final double statLabelFontSize;
  final double statGap;

  /// The strengths shown in the 2-up grid, in display order.
  static const List<AboutHighlight> _highlights = [
    AboutHighlight(
      icon: Icons.architecture_outlined,
      title: AppStrings.aboutHighlightArchitectureTitle,
      body: AppStrings.aboutHighlightArchitectureBody,
    ),
    AboutHighlight(
      icon: Icons.brush_outlined,
      title: AppStrings.aboutHighlightUiTitle,
      body: AppStrings.aboutHighlightUiBody,
    ),
    AboutHighlight(
      icon: Icons.devices_outlined,
      title: AppStrings.aboutHighlightCrossPlatformTitle,
      body: AppStrings.aboutHighlightCrossPlatformBody,
    ),
    AboutHighlight(
      icon: Icons.bolt_outlined,
      title: AppStrings.aboutHighlightPerformanceTitle,
      body: AppStrings.aboutHighlightPerformanceBody,
    ),
  ];

  /// Matches the buttons' own default, so leaving [buttonIconSize] unset keeps
  /// the desktop rendering byte-for-byte identical.
  static const double _defaultButtonIconSize = 18;

  /// Staggered after the header so the column assembles top-to-bottom.
  Duration _delay(int step) => AppDurations.stagger * (4 + step);

  @override
  Widget build(BuildContext context) {
    final bodyStyle = AppTextStyle.withColor(
      AppTextStyle.bodyLarge,
      AppColors.textSecondary,
    ).copyWith(height: 1.8, fontSize: bodyFontSize);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Headline.
        FadeSlideIn(
          delay: _delay(0),
          child: GradientText(
            AppStrings.aboutHeadline,
            style: AppTextStyle.h2.copyWith(
              fontSize: headlineFontSize,
              fontWeight: FontWeight.w600,
              height: 1.3,
            ),
          ),
        ),
        const SizedBox(height: AppDimensions.spaceLG),

        // Prose.
        FadeSlideIn(
          delay: _delay(1),
          child: Text(AppStrings.aboutParagraphOne, style: bodyStyle),
        ),
        const SizedBox(height: AppDimensions.spaceMD),
        FadeSlideIn(
          delay: _delay(2),
          child: Text(
            AppStrings.aboutParagraphTwo,
            style: bodyStyle.copyWith(color: AppColors.textTertiary),
          ),
        ),
        const SizedBox(height: AppDimensions.spaceXL),

        // Strengths.
        FadeSlideIn(
          delay: _delay(3),
          child: const _HighlightGrid(highlights: _highlights),
        ),
        const SizedBox(height: AppDimensions.spaceXL),

        // Headline numbers.
        FadeSlideIn(
          delay: _delay(4),
          child: AboutStats(
            valueFontSize: statValueFontSize,
            labelFontSize: statLabelFontSize,
            gap: statGap,
          ),
        ),
        const SizedBox(height: AppDimensions.spaceXL),

        // Actions.
        FadeSlideIn(
          delay: _delay(5),
          child: Wrap(
            spacing: AppDimensions.spaceMD,
            runSpacing: AppDimensions.spaceMD,
            children: [
              PrimaryButton(
                label: AppStrings.aboutViewProjects,
                icon: Icons.arrow_outward_rounded,
                onPressed: onViewProjects,
                height: buttonHeight,
                horizontalPadding: buttonHorizontalPadding,
                fontSize: buttonFontSize,
                iconSize: buttonIconSize ?? _defaultButtonIconSize,
              ),
              SecondaryButton(
                label: AppStrings.downloadCv,
                icon: Icons.file_download_outlined,
                onPressed: onDownloadCv,
                height: buttonHeight,
                horizontalPadding: buttonHorizontalPadding,
                fontSize: buttonFontSize,
                iconSize: buttonIconSize ?? _defaultButtonIconSize,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Lays the highlights out two per row, dropping to a single column when the
/// resulting tiles would get too narrow to read.
///
/// Rows are wrapped in [IntrinsicHeight] so side-by-side tiles share a height
/// even when one has a longer supporting line.
class _HighlightGrid extends StatelessWidget {
  const _HighlightGrid({required this.highlights});

  final List<AboutHighlight> highlights;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const gap = AppDimensions.aboutHighlightGap;
        final available = constraints.maxWidth;
        final pairedTileWidth = (available - gap) / 2;
        final columns =
            available.isFinite &&
                pairedTileWidth < AppDimensions.aboutHighlightMinTileWidth
            ? 1
            : 2;

        final rows = <List<AboutHighlight>>[];
        for (var i = 0; i < highlights.length; i += columns) {
          rows.add(
            highlights.sublist(
              i,
              (i + columns).clamp(0, highlights.length),
            ),
          );
        }

        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (var r = 0; r < rows.length; r++) ...[
              if (r > 0) const SizedBox(height: gap),
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    for (var c = 0; c < rows[r].length; c++) ...[
                      if (c > 0) const SizedBox(width: gap),
                      Expanded(
                        child: AboutHighlightTile(highlight: rows[r][c]),
                      ),
                    ],
                    // Keep a lone tile in the last row the same width as the
                    // tiles above it instead of stretching it full width.
                    if (rows[r].length < columns)
                      for (var f = rows[r].length; f < columns; f++) ...[
                        const SizedBox(width: gap),
                        const Spacer(),
                      ],
                  ],
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}
