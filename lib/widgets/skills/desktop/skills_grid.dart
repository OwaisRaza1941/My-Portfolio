import 'package:flutter/material.dart';

import '../../../models/skill_category.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/app_durations.dart';
import '../../common/fade_slide_in.dart';
import 'skill_category_card.dart';

/// Lays the skill cards out as a balanced masonry: each column is its own
/// [Column] of cards, so a card keeps its natural height instead of being
/// stretched to match the tallest card in its row.
///
/// Cards are handed to the column that is currently shortest, estimated from the
/// number of chips they carry — that keeps the "Database & Storage" card (nine
/// chips) from leaving a tall gap beside "State Management" (two).
class SkillsGrid extends StatelessWidget {
  const SkillsGrid({
    super.key,
    required this.categories,
    this.gap = AppDimensions.skillsGridGap,
    this.minCardWidth = AppDimensions.skillsMinCardWidth,
    this.maxColumns = AppDimensions.skillsMaxColumns,
    this.cardBuilder,
  });

  final List<SkillCategory> categories;

  /// Gap between cards, both horizontally and vertically.
  final double gap;

  /// Below this card width the grid drops a column.
  final double minCardWidth;

  /// Upper bound on columns, whatever the available width allows.
  final int maxColumns;

  /// Optional card override, so compact layouts can supply their own typography
  /// without duplicating the distribution logic.
  final Widget Function(SkillCategory category)? cardBuilder;

  /// Roughly how "tall" a card is, in chip units. The constant stands in for the
  /// icon row and padding, which every card pays regardless of its chip count.
  static double _weight(SkillCategory category) => 2.5 + category.skills.length;

  /// Splits [categories] across [columns], always appending to the column with
  /// the least accumulated weight so far.
  static List<List<SkillCategory>> _distribute(
    List<SkillCategory> categories,
    int columns,
  ) {
    final buckets = List.generate(columns, (_) => <SkillCategory>[]);
    final weights = List<double>.filled(columns, 0);

    for (final category in categories) {
      var shortest = 0;
      for (var i = 1; i < columns; i++) {
        if (weights[i] < weights[shortest]) shortest = i;
      }
      buckets[shortest].add(category);
      weights[shortest] += _weight(category);
    }

    return buckets;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final available = constraints.maxWidth;

        // How many columns of at least [minCardWidth] fit, capped both by
        // [maxColumns] and by the number of cards we actually have.
        var columns = maxColumns;
        if (available.isFinite) {
          while (columns > 1 &&
              (available - gap * (columns - 1)) / columns < minCardWidth) {
            columns--;
          }
        }
        columns = columns.clamp(1, categories.length);

        final buckets = _distribute(categories, columns);

        // Entrance stagger follows the original reading order, not the column
        // the card ended up in.
        final order = {
          for (var i = 0; i < categories.length; i++) categories[i].title: i,
        };

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var c = 0; c < buckets.length; c++) ...[
              if (c > 0) SizedBox(width: gap),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    for (var i = 0; i < buckets[c].length; i++) ...[
                      if (i > 0) SizedBox(height: gap),
                      FadeSlideIn(
                        delay:
                            AppDurations.stagger *
                            (4 + (order[buckets[c][i].title] ?? 0)),
                        child:
                            cardBuilder?.call(buckets[c][i]) ??
                            SkillCategoryCard(category: buckets[c][i]),
                      ),
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
