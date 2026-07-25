import 'package:flutter/material.dart';

import '../../../utils/app_color.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/app_durations.dart';
import '../../../utils/text_style.dart';
import '../../common/hover_builder.dart';

/// A single interactive navigation link with an animated underline and color
/// shift on hover. The [isActive] flag renders the currently selected section
/// in the accent color with a persistent underline.
class NavLink extends StatelessWidget {
  const NavLink({
    super.key,
    required this.label,
    required this.onTap,
    this.isActive = false,
  });

  final String label;
  final VoidCallback onTap;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return HoverBuilder(
      onTap: onTap,
      builder: (context, isHovered) {
        final highlighted = isHovered || isActive;
        final color = highlighted
            ? AppColors.textPrimary
            : AppColors.textTertiary;

        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.navItemHorizontalPadding,
            vertical: AppDimensions.navItemVerticalPadding,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedDefaultTextStyle(
                duration: AppDurations.fast,
                style: AppTextStyle.withColor(
                  AppTextStyle.bodyMedium,
                  color,
                ).copyWith(fontWeight: FontWeight.w500),
                child: Text(label),
              ),
              const SizedBox(height: AppDimensions.spaceXS),
              // Underline grows from the center on hover / when active.
              AnimatedContainer(
                duration: AppDurations.fast,
                curve: Curves.easeOut,
                height: 2,
                width: highlighted ? 20 : 0,
                decoration: BoxDecoration(
                  color: AppColors.primaryLight,
                  borderRadius: BorderRadius.circular(AppDimensions.radiusPill),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
