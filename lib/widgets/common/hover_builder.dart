import 'package:flutter/material.dart';

/// A reusable wrapper that tracks pointer hover state and exposes it to a
/// builder, so any child can react to hover without re-implementing the
/// [MouseRegion] boilerplate every time.
///
/// It also switches the system cursor to a click cursor, which is the expected
/// affordance for interactive elements on the web.
///
/// Example:
/// ```dart
/// HoverBuilder(
///   builder: (context, isHovered) => AnimatedScale(
///     scale: isHovered ? 1.05 : 1.0,
///     duration: AppDurations.fast,
///     child: child,
///   ),
/// )
/// ```
class HoverBuilder extends StatefulWidget {
  const HoverBuilder({
    super.key,
    required this.builder,
    this.cursor = SystemMouseCursors.click,
    this.onTap,
  });

  /// Builds the child using the current hover state.
  final Widget Function(BuildContext context, bool isHovered) builder;

  /// Cursor shown while hovering.
  final MouseCursor cursor;

  /// Optional tap handler. When provided the whole area becomes tappable.
  final VoidCallback? onTap;

  @override
  State<HoverBuilder> createState() => _HoverBuilderState();
}

class _HoverBuilderState extends State<HoverBuilder> {
  bool _isHovered = false;

  void _setHovered(bool value) {
    if (_isHovered == value) return;
    setState(() => _isHovered = value);
  }

  @override
  Widget build(BuildContext context) {
    final child = MouseRegion(
      cursor: widget.cursor,
      onEnter: (_) => _setHovered(true),
      onExit: (_) => _setHovered(false),
      child: widget.builder(context, _isHovered),
    );

    if (widget.onTap == null) return child;

    return GestureDetector(
      onTap: widget.onTap,
      behavior: HitTestBehavior.opaque,
      child: child,
    );
  }
}
