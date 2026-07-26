import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../models/nav_item.dart';
import 'app_durations.dart';

/// Wires the nav bar / drawer entries to the sections of a single scrolling
/// page.
///
/// A screen mixes this in, drives its [SingleChildScrollView] with
/// [scrollController], wraps each section in [section] with the matching
/// anchor, and hands [onNavItemTap] to its nav bar. Tapping an entry animates
/// the page so that section's top edge lands under the bar, and scrolling by
/// hand keeps [activeAnchor] — the highlighted entry — in sync.
///
/// Sections are located by measuring their render objects rather than by a
/// declared order, so the desktop and mobile layouts can list them in different
/// orders without any extra bookkeeping here.
mixin SectionNavigation<T extends StatefulWidget> on State<T> {
  /// Every anchor the nav bars can target. Order here is irrelevant — the
  /// active entry is resolved from the measured layout.
  static const List<String> anchors = [
    'home',
    'about',
    'services',
    'skills',
    'projects',
    'contact',
  ];

  /// Anchor used for the top of the page.
  static const String homeAnchor = 'home';

  /// How far above a section's top edge it already counts as "current", which
  /// keeps the highlight from lagging behind while the page settles.
  static const double _activationSlack = 140;

  /// Drives the page scroll view. Also handed to the "back to top" button.
  final ScrollController scrollController = ScrollController();

  final Map<String, GlobalKey> _sectionKeys = {
    for (final anchor in anchors) anchor: GlobalKey(debugLabel: 'section-$anchor'),
  };

  /// Anchor of the section currently in view; feed this to the nav bar so the
  /// matching link stays lit.
  String get activeAnchor => _activeAnchor;
  String _activeAnchor = homeAnchor;

  /// While a tap-driven scroll is in flight the highlight is pinned to the
  /// destination, so it doesn't flicker through every section on the way.
  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_syncActiveAnchor);
  }

  @override
  void dispose() {
    scrollController.removeListener(_syncActiveAnchor);
    scrollController.dispose();
    super.dispose();
  }

  /// Tags [child] as the section for [anchor] so the nav bar can find it.
  Widget section(String anchor, Widget child) =>
      KeyedSubtree(key: _sectionKeys[anchor]!, child: child);

  /// Nav bar / drawer callback.
  void onNavItemTap(NavItem item) => scrollToAnchor(item.anchor);

  /// Animates the page so the top of [anchor]'s section sits at the top of the
  /// viewport. Silently does nothing if that section isn't laid out.
  Future<void> scrollToAnchor(String anchor) async {
    if (!scrollController.hasClients) return;

    final position = scrollController.position;
    final double? target = anchor == homeAnchor ? 0 : _offsetOf(anchor);
    if (target == null) return;

    if (_activeAnchor != anchor) setState(() => _activeAnchor = anchor);

    _isAnimating = true;
    await scrollController.animateTo(
      target.clamp(position.minScrollExtent, position.maxScrollExtent),
      duration: AppDurations.sectionScroll,
      curve: Curves.easeInOutCubic,
    );
    if (!mounted) return;
    _isAnimating = false;
    _syncActiveAnchor();
  }

  /// Scroll offset at which [anchor]'s section reaches the top of the viewport,
  /// or null while it is off-stage.
  double? _offsetOf(String anchor) {
    final BuildContext? context = _sectionKeys[anchor]?.currentContext;
    if (context == null) return null;

    final RenderObject? box = context.findRenderObject();
    if (box is! RenderBox || !box.attached) return null;

    final RenderAbstractViewport? viewport = RenderAbstractViewport.maybeOf(box);
    if (viewport == null) return null;

    return viewport.getOffsetToReveal(box, 0).offset;
  }

  /// Picks the last section whose top has passed the viewport top and lights it
  /// up in the nav bar.
  void _syncActiveAnchor() {
    if (_isAnimating || !scrollController.hasClients) return;

    final position = scrollController.position;
    final double offset = position.pixels;

    String current = homeAnchor;
    double currentOffset = 0;

    for (final anchor in anchors) {
      final double? sectionOffset = _offsetOf(anchor);
      if (sectionOffset == null) continue;
      if (offset >= sectionOffset - _activationSlack &&
          sectionOffset >= currentOffset) {
        current = anchor;
        currentOffset = sectionOffset;
      }
    }

    // The final section is usually shorter than the viewport, so its top never
    // reaches the top edge — pin it once the page bottoms out.
    if (offset >= position.maxScrollExtent - 1) {
      final String? last = _lastAnchorByOffset();
      if (last != null) current = last;
    }

    if (current != _activeAnchor) setState(() => _activeAnchor = current);
  }

  /// The anchor furthest down the page, by measured position.
  String? _lastAnchorByOffset() {
    String? last;
    double lastOffset = -1;
    for (final anchor in anchors) {
      final double? sectionOffset = _offsetOf(anchor);
      if (sectionOffset != null && sectionOffset > lastOffset) {
        lastOffset = sectionOffset;
        last = anchor;
      }
    }
    return last;
  }
}
