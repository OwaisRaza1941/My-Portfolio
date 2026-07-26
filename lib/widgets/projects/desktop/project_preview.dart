import 'package:flutter/material.dart';

import '../../../utils/app_color.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/app_durations.dart';

/// The project screenshot, shown plain — no phone frame, no bezel, no tint.
///
/// The capture is drawn at its own aspect ratio inside a fixed [width], so
/// nothing is cropped and the image keeps its true colors.
///
/// It has no hover state of its own — [isHovered] comes from the showcase row
/// around it, so the screenshot and the copy beside it react to the pointer as
/// one surface; hover only lifts it slightly.
class ProjectPreview extends StatelessWidget {
  const ProjectPreview({
    super.key,
    required this.imageAsset,
    this.isHovered = false,
    this.width = AppDimensions.projectPreviewWidth,
  });

  final String imageAsset;

  /// Whether the showcase row around this preview is hovered.
  final bool isHovered;

  final double width;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: AppDurations.medium,
      curve: Curves.easeOut,
      width: width,
      transform: Matrix4.translationValues(
        0,
        isHovered ? -AppDimensions.projectPreviewHoverLift : 0,
        0,
      ),
      child: Image.asset(
        imageAsset,
        width: width,
        fit: BoxFit.contain,
        filterQuality: FilterQuality.medium,
        // A screenshot that fails to decode must not take the row down with
        // it — fall back to a quiet placeholder block.
        errorBuilder: (context, error, stackTrace) => SizedBox(
          width: width,
          height: width / AppDimensions.projectPreviewAspectRatio,
          child: const ColoredBox(color: AppColors.surface),
        ),
      ),
    );
  }
}
