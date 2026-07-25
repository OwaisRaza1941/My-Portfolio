import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../models/code_token.dart';
import '../../../utils/app_color.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/app_strings.dart';
import '../../../utils/text_style.dart';
import '../../common/blinking_caret.dart';

/// A faux editor window rendering a short, syntax-highlighted Dart snippet that
/// introduces the developer — the "developer illustration" for the about
/// section, drawn entirely in Flutter so it stays crisp at any size and needs
/// no image asset.
///
/// It is purely decorative: the snippet is static content, and a blinking caret
/// on the last line gives it the feel of a live editor.
class CodeWindow extends StatelessWidget {
  const CodeWindow({super.key, this.fontSize});

  /// Overrides the snippet's font size so compact layouts can shrink the
  /// window without reflowing the code.
  final double? fontSize;

  /// The snippet, described as tokens so this widget owns the palette.
  static const List<CodeLine> _snippet = [
    [
      CodeToken.keyword('class '),
      CodeToken.type('AboutMe'),
      CodeToken(' '),
      CodeToken.keyword('extends '),
      CodeToken.type('Developer'),
      CodeToken.punctuation(' {'),
    ],
    [
      CodeToken.keyword('  final '),
      CodeToken.type('String'),
      CodeToken(' name '),
      CodeToken.punctuation('= '),
      CodeToken.string("'Owais Raza'"),
      CodeToken.punctuation(';'),
    ],
    [
      CodeToken.keyword('  final '),
      CodeToken.type('String'),
      CodeToken(' role '),
      CodeToken.punctuation('= '),
      CodeToken.string("'Flutter Developer'"),
      CodeToken.punctuation(';'),
    ],
    [],
    [CodeToken.annotation('  @override')],
    [
      CodeToken.type('  List'),
      CodeToken.punctuation('<'),
      CodeToken.type('String'),
      CodeToken.punctuation('> '),
      CodeToken.keyword('get '),
      CodeToken('stack '),
      CodeToken.punctuation('=> ['),
    ],
    [
      CodeToken.string("    'Flutter'"),
      CodeToken.punctuation(', '),
      CodeToken.string("'Dart'"),
      CodeToken.punctuation(', '),
      CodeToken.string("'Firebase'"),
      CodeToken.punctuation(','),
    ],
    [
      CodeToken.string("    'Clean Architecture'"),
      CodeToken.punctuation(', '),
      CodeToken.string("'REST'"),
      CodeToken.punctuation(','),
    ],
    [CodeToken.punctuation('  ];')],
    [],
    [CodeToken.annotation('  @override')],
    [
      CodeToken.type('  Future'),
      CodeToken.punctuation('<'),
      CodeToken.type('App'),
      CodeToken.punctuation('> '),
      CodeToken('build'),
      CodeToken.punctuation('('),
      CodeToken.type('Idea'),
      CodeToken(' idea'),
      CodeToken.punctuation(') '),
      CodeToken.keyword('async '),
      CodeToken.punctuation('{'),
    ],
    [CodeToken.comment('    // Design in, product out.')],
    [
      CodeToken.keyword('    return '),
      CodeToken('idea'),
      CodeToken.punctuation('.'),
      CodeToken('toPixelPerfect'),
      CodeToken.punctuation('();'),
    ],
    [CodeToken.punctuation('  }')],
    [CodeToken.punctuation('}')],
  ];

  /// Maps a token role onto the brand code palette.
  static Color _colorFor(CodeTokenKind kind) {
    switch (kind) {
      case CodeTokenKind.keyword:
        return AppColors.codeKeyword;
      case CodeTokenKind.type:
        return AppColors.codeType;
      case CodeTokenKind.string:
        return AppColors.codeString;
      case CodeTokenKind.annotation:
        return AppColors.codeAnnotation;
      case CodeTokenKind.punctuation:
        return AppColors.codePunctuation;
      case CodeTokenKind.comment:
        return AppColors.codeComment;
      case CodeTokenKind.plain:
        return AppColors.codeText;
    }
  }

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(AppDimensions.aboutCodeWindowRadius);
    final codeStyle = AppTextStyle.code.copyWith(fontSize: fontSize);
    final lastIndex = _snippet.length - 1;

    return DecoratedBox(
      // Outer bloom, so the window feels lit from within against the
      // animated background.
      decoration: BoxDecoration(
        borderRadius: radius,
        boxShadow: [
          BoxShadow(
            color: AppColors.glow.withValues(alpha: 0.35),
            blurRadius: 60,
            spreadRadius: -8,
            offset: const Offset(0, 24),
          ),
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 30,
            offset: const Offset(0, 16),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: radius,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: radius,
            color: AppColors.codeWindowBackground,
            border: Border.all(
              color: AppColors.border.withValues(alpha: 0.9),
              width: AppDimensions.borderThin,
            ),
          ),
          child: Stack(
            children: [
              // Interior top-left sheen.
              const Positioned.fill(child: _InteriorGlow()),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const _WindowChrome(),
                  Padding(
                    padding: const EdgeInsets.all(
                      AppDimensions.aboutCodeWindowPadding,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (var i = 0; i < _snippet.length; i++)
                          _CodeLineView(
                            lineNumber: i + 1,
                            tokens: _snippet[i],
                            style: codeStyle,
                            showCaret: i == lastIndex,
                          ),
                      ],
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

  /// Exposed so the illustration can build the same colored text for tokens.
  static TextSpan spanFor(CodeToken token, TextStyle style) {
    return TextSpan(
      text: token.text,
      style: style.copyWith(color: _colorFor(token.kind)),
    );
  }
}

/// The faux title bar: traffic-light dots plus an active "file tab".
class _WindowChrome extends StatelessWidget {
  const _WindowChrome();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.aboutCodeWindowChromeHeight,
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.spaceMD,
      ),
      decoration: BoxDecoration(
        color: AppColors.surface.withValues(alpha: 0.75),
        border: Border(
          bottom: BorderSide(
            color: AppColors.border.withValues(alpha: 0.7),
            width: AppDimensions.borderThin,
          ),
        ),
      ),
      child: Row(
        children: [
          const _WindowDot(color: AppColors.error),
          const SizedBox(width: AppDimensions.aboutWindowDotSpacing),
          const _WindowDot(color: AppColors.warning),
          const SizedBox(width: AppDimensions.aboutWindowDotSpacing),
          const _WindowDot(color: AppColors.success),
          const SizedBox(width: AppDimensions.spaceLG),
          const Flexible(child: _FileTab()),
        ],
      ),
    );
  }
}

/// A single macOS-style window dot.
class _WindowDot extends StatelessWidget {
  const _WindowDot({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.aboutWindowDotSize,
      height: AppDimensions.aboutWindowDotSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withValues(alpha: 0.9),
        boxShadow: [
          BoxShadow(color: color.withValues(alpha: 0.45), blurRadius: 6),
        ],
      ),
    );
  }
}

/// The open-file chip beside the dots, e.g. "🞄 about_me.dart".
class _FileTab extends StatelessWidget {
  const _FileTab();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.spaceSM + AppDimensions.spaceXS,
        vertical: AppDimensions.spaceXS + 1,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimensions.radiusSM),
        color: AppColors.primary.withValues(alpha: 0.12),
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.35),
          width: AppDimensions.borderThin,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const FaIcon(
            FontAwesomeIcons.dartLang,
            size: 11,
            color: AppColors.codeType,
          ),
          const SizedBox(width: AppDimensions.spaceSM),
          Flexible(
            child: Text(
              AppStrings.aboutCodeFileName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.code.copyWith(
                fontSize: 12,
                color: AppColors.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// One line of the snippet: a right-aligned line number in the gutter, then the
/// colored code, then (on the final line) the blinking caret.
class _CodeLineView extends StatelessWidget {
  const _CodeLineView({
    required this.lineNumber,
    required this.tokens,
    required this.style,
    required this.showCaret,
  });

  final int lineNumber;
  final CodeLine tokens;
  final TextStyle style;
  final bool showCaret;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimensions.aboutCodeLineHeight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: AppDimensions.aboutCodeGutterWidth,
            child: Text(
              '$lineNumber',
              textAlign: TextAlign.right,
              style: style.copyWith(color: AppColors.codeLineNumber),
            ),
          ),
          const SizedBox(width: AppDimensions.spaceMD),
          // Long lines clip at the window edge rather than overflowing, which
          // keeps the window safe at any column width.
          Flexible(
            child: Text.rich(
              TextSpan(
                children: [
                  for (final token in tokens)
                    CodeWindow.spanFor(token, style),
                ],
              ),
              maxLines: 1,
              softWrap: false,
              overflow: TextOverflow.clip,
            ),
          ),
          if (showCaret) ...[
            const SizedBox(width: AppDimensions.spaceXS + 2),
            const BlinkingCaret(),
          ],
        ],
      ),
    );
  }
}

/// A soft blue sheen in the window's upper-left corner.
class _InteriorGlow extends StatelessWidget {
  const _InteriorGlow();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: const Alignment(-0.7, -1.0),
          radius: 1.1,
          colors: [
            AppColors.primary.withValues(alpha: 0.16),
            AppColors.primary.withValues(alpha: 0),
          ],
        ),
      ),
    );
  }
}
