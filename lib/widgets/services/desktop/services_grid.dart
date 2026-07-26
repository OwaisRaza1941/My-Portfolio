import 'package:flutter/material.dart';

import '../../../models/service_item.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/app_durations.dart';
import '../../common/fade_slide_in.dart';
import 'service_card.dart';

/// Lays the service cards out as a uniform grid of equal-height rows.
///
/// Unlike the skills masonry — where a card's height follows its chip count —
/// service cards each carry the same three deliverables, so a plain grid with
/// [IntrinsicHeight] rows reads cleaner: every card in a row shares one top and
/// one bottom edge.
class ServicesGrid extends StatelessWidget {
  const ServicesGrid({
    super.key,
    required this.services,
    this.gap = AppDimensions.servicesGridGap,
    this.minCardWidth = AppDimensions.servicesMinCardWidth,
    this.maxColumns = AppDimensions.servicesMaxColumns,
    this.staggerOffset = 4,
    this.cardBuilder,
  });

  final List<ServiceItem> services;

  /// Gap between cards, both horizontally and vertically.
  final double gap;

  /// Below this card width the grid drops a column.
  final double minCardWidth;

  /// Upper bound on columns, whatever the available width allows.
  final int maxColumns;

  /// How many stagger steps the header already consumed, so the cards continue
  /// the section's entrance rather than restarting it.
  final int staggerOffset;

  /// Optional card override, so compact layouts can supply their own typography
  /// without duplicating the column maths.
  final Widget Function(ServiceItem service, int index)? cardBuilder;

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
        columns = columns.clamp(1, services.length);

        final rows = (services.length / columns).ceil();

        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (var r = 0; r < rows; r++) ...[
              if (r > 0) SizedBox(height: gap),
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    for (var c = 0; c < columns; c++) ...[
                      if (c > 0) SizedBox(width: gap),
                      Expanded(
                        // A short final row keeps its empty cells, so the last
                        // card stays column-aligned instead of stretching to
                        // fill the width.
                        child: _cell(r * columns + c),
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

  Widget _cell(int index) {
    if (index >= services.length) return const SizedBox.shrink();

    return FadeSlideIn(
      delay: AppDurations.stagger * (staggerOffset + index),
      child:
          cardBuilder?.call(services[index], index) ??
          ServiceCard(service: services[index], index: index),
    );
  }
}
