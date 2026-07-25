import 'package:flutter/material.dart';

import '../../../utils/app_color.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/app_durations.dart';
import '../../common/hover_builder.dart';

/// The glass square that toggles the mobile navigation drawer.
///
/// The glyph morphs between the hamburger and a cross using [AnimatedIcons],
/// driven by [isOpen], and the tile picks up the signature blue border + glow
/// while it is open or hovered — matching the social icons and primary button.
class MenuToggleButton extends StatefulWidget {
  const MenuToggleButton({
    super.key,
    required this.isOpen,
    required this.onTap,
    this.tooltip,
  });

  /// Whether the drawer is currently open. Drives the menu → cross morph.
  final bool isOpen;

  final VoidCallback onTap;

  /// Optional tooltip / semantics label for the button.
  final String? tooltip;

  @override
  State<MenuToggleButton> createState() => _MenuToggleButtonState();
}

class _MenuToggleButtonState extends State<MenuToggleButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: AppDurations.fast,
    value: widget.isOpen ? 1 : 0,
  );

  @override
  void didUpdateWidget(covariant MenuToggleButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isOpen == oldWidget.isOpen) return;
    widget.isOpen ? _controller.forward() : _controller.reverse();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HoverBuilder(
      onTap: widget.onTap,
      builder: (context, isHovered) {
        final highlighted = isHovered || widget.isOpen;

        final button = AnimatedContainer(
          duration: AppDurations.fast,
          curve: Curves.easeOut,
          width: AppDimensions.mobileMenuButtonSize,
          height: AppDimensions.mobileMenuButtonSize,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDimensions.radiusMD),
            color: highlighted
                ? AppColors.primary.withValues(alpha: 0.16)
                : AppColors.card.withValues(alpha: 0.6),
            border: Border.all(
              color: highlighted
                  ? AppColors.primaryLight.withValues(alpha: 0.8)
                  : AppColors.border,
              width: AppDimensions.borderThin,
            ),
            boxShadow: highlighted
                ? const [
                    BoxShadow(
                      color: AppColors.glow,
                      blurRadius: 18,
                      offset: Offset(0, 6),
                    ),
                  ]
                : const [],
          ),
          child: Center(
            child: AnimatedIcon(
              icon: AnimatedIcons.menu_close,
              progress: _controller,
              size: AppDimensions.mobileMenuIconSize,
              color: highlighted
                  ? AppColors.textPrimary
                  : AppColors.textSecondary,
            ),
          ),
        );

        if (widget.tooltip == null) return button;
        return Tooltip(message: widget.tooltip!, child: button);
      },
    );
  }
}
