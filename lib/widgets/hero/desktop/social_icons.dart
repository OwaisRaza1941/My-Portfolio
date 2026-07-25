import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../models/social_link.dart';
import '../../../utils/app_color.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/app_durations.dart';
import '../../../utils/app_strings.dart';
import '../../common/hover_builder.dart';

/// A horizontal row of social media icon buttons (GitHub, LinkedIn, Instagram,
/// Email). Each button is a rounded glass square that lifts, brightens toward
/// its platform brand color, and glows on hover.
class SocialIcons extends StatelessWidget {
  const SocialIcons({super.key, required this.onOpen});

  /// Called with the destination URL when an icon is tapped.
  final ValueChanged<String> onOpen;

  /// The social links to display, in order.
  static const List<SocialLink> _links = [
    SocialLink(
      label: AppStrings.socialGithub,
      icon: FontAwesomeIcons.github,
      url: AppStrings.githubUrl,
      brandColor: AppColors.github,
    ),
    SocialLink(
      label: AppStrings.socialLinkedIn,
      icon: FontAwesomeIcons.linkedinIn,
      url: AppStrings.linkedInUrl,
      brandColor: AppColors.linkedin,
    ),
    SocialLink(
      label: AppStrings.socialInstagram,
      icon: FontAwesomeIcons.instagram,
      url: AppStrings.instagramUrl,
      brandColor: AppColors.instagram,
    ),
    SocialLink(
      label: AppStrings.socialEmail,
      icon: FontAwesomeIcons.solidEnvelope,
      url: AppStrings.emailUrl,
      brandColor: AppColors.gmail,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final link in _links)
          Padding(
            padding: const EdgeInsets.only(
              right: AppDimensions.socialIconSpacing,
            ),
            child: _SocialIconButton(link: link, onTap: () => onOpen(link.url)),
          ),
      ],
    );
  }
}

class _SocialIconButton extends StatelessWidget {
  const _SocialIconButton({required this.link, required this.onTap});

  final SocialLink link;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return HoverBuilder(
      onTap: onTap,
      builder: (context, isHovered) {
        return Tooltip(
          message: link.label,
          child: AnimatedContainer(
            duration: AppDurations.fast,
            curve: Curves.easeOut,
            width: AppDimensions.socialIconSize,
            height: AppDimensions.socialIconSize,
            transform: Matrix4.translationValues(0, isHovered ? -4 : 0, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimensions.radiusMD),
              color: isHovered
                  ? link.brandColor.withValues(alpha: 0.14)
                  : AppColors.card.withValues(alpha: 0.6),
              border: Border.all(
                color: isHovered
                    ? link.brandColor.withValues(alpha: 0.8)
                    : AppColors.border,
                width: AppDimensions.borderThin,
              ),
              boxShadow: isHovered
                  ? [
                      BoxShadow(
                        color: link.brandColor.withValues(alpha: 0.35),
                        blurRadius: 18,
                        offset: const Offset(0, 6),
                      ),
                    ]
                  : const [],
            ),
            child: Center(
              child: FaIcon(
                link.icon,
                size: AppDimensions.socialIconGlyphSize,
                color: isHovered ? link.brandColor : AppColors.textSecondary,
              ),
            ),
          ),
        );
      },
    );
  }
}
