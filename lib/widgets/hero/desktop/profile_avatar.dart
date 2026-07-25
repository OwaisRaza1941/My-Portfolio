import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../utils/app_color.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/app_strings.dart';
import '../../../utils/text_style.dart';

/// The large circular hero portrait: a slowly rotating electric-blue glow ring
/// wrapping a circular image, sitting inside a soft outer bloom.
///
/// If [image] is null (no asset wired up yet) it renders an elegant gradient
/// placeholder with the developer's initials, so the UI looks complete out of
/// the box. Drop in an [image] later to show the real photo.
class ProfileAvatar extends StatefulWidget {
  const ProfileAvatar({
    super.key,
    this.image,
    this.size = AppDimensions.profileImageSize,
  });

  /// Optional portrait. When provided it fills the circular frame.
  final ImageProvider? image;
  final double size;

  @override
  State<ProfileAvatar> createState() => _ProfileAvatarState();
}

class _ProfileAvatarState extends State<ProfileAvatar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ringController;

  @override
  void initState() {
    super.initState();
    // Slow, continuous rotation of the gradient ring.
    _ringController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat();
  }

  @override
  void dispose() {
    _ringController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = widget.size;

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Soft outer bloom.
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.glow.withValues(alpha: 0.55),
                  blurRadius: 90,
                  spreadRadius: 10,
                ),
              ],
            ),
          ),

          // Rotating gradient ring.
          AnimatedBuilder(
            animation: _ringController,
            builder: (context, child) => Transform.rotate(
              angle: _ringController.value * 2 * math.pi,
              child: child,
            ),
            child: Container(
              width: size,
              height: size,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: SweepGradient(
                  colors: [
                    AppColors.primary,
                    AppColors.accentGlow,
                    AppColors.primaryLight,
                    AppColors.primaryDark,
                    AppColors.primary,
                  ],
                ),
              ),
            ),
          ),

          // Inner portrait, inset to reveal the ring as a thin rim.
          Padding(
            padding: const EdgeInsets.all(AppDimensions.profileRingWidth),
            child: ClipOval(
              child: SizedBox(
                width: size - AppDimensions.profileRingWidth * 2,
                height: size - AppDimensions.profileRingWidth * 2,
                child: _Portrait(image: widget.image),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// The circular portrait surface — either the supplied [image] or a gradient
/// initials placeholder.
class _Portrait extends StatelessWidget {
  const _Portrait({this.image});

  final ImageProvider? image;

  @override
  Widget build(BuildContext context) {
    if (image != null) {
      return Image(image: image!, fit: BoxFit.cover);
    }

    // Placeholder: dark gradient disc with initials and a subtle person icon.
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.card, AppColors.section, AppColors.scaffoldBackground],
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: -20,
            child: Icon(
              Icons.person_rounded,
              size: 240,
              color: AppColors.primary.withValues(alpha: 0.14),
            ),
          ),
          Text(
            AppStrings.initials,
            style: AppTextStyle.h1.copyWith(
              fontSize: 96,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary.withValues(alpha: 0.92),
              letterSpacing: 2,
            ),
          ),
        ],
      ),
    );
  }
}
