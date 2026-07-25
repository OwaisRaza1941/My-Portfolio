import 'package:flutter/material.dart';

import '../../../utils/app_color.dart';
import '../../../utils/app_durations.dart';
import '../../../utils/app_strings.dart';
import '../../../utils/text_style.dart';
import '../../common/hover_builder.dart';

/// The brand wordmark shown at the left of the navigation bar.
///
/// Renders the name with an accent-colored trailing dot and a soft glow that
/// intensifies on hover.
class BrandLogo extends StatelessWidget {
  const BrandLogo({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return HoverBuilder(
      onTap: onTap,
      builder: (context, isHovered) {
        return AnimatedDefaultTextStyle(
          duration: AppDurations.fast,
          style: AppTextStyle.withColor(
            AppTextStyle.h3,
            AppColors.textPrimary,
          ).copyWith(
            letterSpacing: 0.5,
            shadows: isHovered
                ? [
                    const Shadow(
                      color: AppColors.glow,
                      blurRadius: 18,
                    ),
                  ]
                : const [],
          ),
          child: Text.rich(
            TextSpan(
              text: AppStrings.logo.replaceAll('.', ''),
              children: const [
                TextSpan(
                  text: '.',
                  style: TextStyle(color: AppColors.primaryLight),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
