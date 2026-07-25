import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../models/nav_item.dart';
import '../../../utils/app_color.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/app_durations.dart';
import '../../../utils/app_strings.dart';
import '../../../utils/text_style.dart';
import '../../buttons/primary_button.dart';
import '../../common/fade_slide_in.dart';
import '../../common/hover_builder.dart';
import '../../hero/desktop/availability_badge.dart';
import '../../hero/desktop/social_icons.dart';
import '../desktop/brand_logo.dart';
import 'menu_toggle_button.dart';

/// The slide-in navigation panel for phones.
///
/// Built as a frosted glass sheet — rounded on its leading edge, tinted with
/// the brand gradient and lit by a thin accent border — so it reads as part of
/// the same surface family as the hero cards and nav bar rather than a stock
/// Material drawer.
class MobileDrawer extends StatelessWidget {
  const MobileDrawer({
    super.key,
    required this.onNavItemTap,
    required this.onHireMe,
    required this.onOpenSocial,
    this.activeAnchor,
  });

  /// Called with the tapped item so the parent can scroll to its section.
  final ValueChanged<NavItem> onNavItemTap;

  final VoidCallback onHireMe;

  /// Opens a social link URL.
  final ValueChanged<String> onOpenSocial;

  /// Anchor of the section currently in view, highlighted in the list.
  final String? activeAnchor;

  /// The navigation entries, in display order.
  static const List<NavItem> _items = [
    NavItem(label: AppStrings.navHome, anchor: 'home'),
    NavItem(label: AppStrings.navAbout, anchor: 'about'),
    NavItem(label: AppStrings.navServices, anchor: 'services'),
    NavItem(label: AppStrings.navSkills, anchor: 'skills'),
    NavItem(label: AppStrings.navProjects, anchor: 'projects'),
    NavItem(label: AppStrings.navContact, anchor: 'contact'),
  ];

  /// Rounded leading edge of the sheet.
  static const BorderRadius _sheetRadius = BorderRadius.horizontal(
    left: Radius.circular(AppDimensions.radiusXL),
  );

  @override
  Widget build(BuildContext context) {
    // Cap the panel so it never swallows the whole viewport on small phones.
    final width = math.min(
      AppDimensions.mobileDrawerWidth,
      MediaQuery.sizeOf(context).width * AppDimensions.mobileDrawerWidthFactor,
    );

    return Drawer(
      width: width,
      elevation: 0,
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(borderRadius: _sheetRadius),
      child: ClipRRect(
        borderRadius: _sheetRadius,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.surface.withValues(alpha: 0.96),
                  AppColors.scaffoldBackground.withValues(alpha: 0.98),
                ],
              ),
              border: Border(
                left: BorderSide(
                  color: AppColors.primary.withValues(alpha: 0.3),
                  width: AppDimensions.borderThick,
                ),
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.mobileHorizontalPadding,
                  vertical: AppDimensions.spaceMD,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _Header(onClose: () => Navigator.pop(context)),

                    const SizedBox(height: AppDimensions.spaceLG),
                    const _AccentDivider(),
                    const SizedBox(height: AppDimensions.spaceMD),

                    Expanded(
                      child: ListView.separated(
                        padding: EdgeInsets.zero,
                        physics: const BouncingScrollPhysics(),
                        itemCount: _items.length,
                        separatorBuilder: (context, index) => const SizedBox(
                          height: AppDimensions.mobileDrawerItemGap,
                        ),
                        itemBuilder: (context, index) {
                          final item = _items[index];

                          return FadeSlideIn(
                            // Rows cascade in behind the sliding panel.
                            delay: AppDurations.stagger * (index * 0.35),
                            duration: AppDurations.medium,
                            offset: const Offset(24, 0),
                            child: _DrawerNavTile(
                              item: item,
                              index: index,
                              isActive: item.anchor == activeAnchor,
                              onTap: () {
                                Navigator.pop(context);
                                onNavItemTap(item);
                              },
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: AppDimensions.spaceMD),
                    const _AccentDivider(),
                    const SizedBox(height: AppDimensions.spaceMD),

                    const AvailabilityBadge(),

                    const SizedBox(height: AppDimensions.spaceMD),

                    SizedBox(
                      width: double.infinity,
                      child: PrimaryButton(
                        label: AppStrings.hireMe,
                        icon: Icons.arrow_outward_rounded,
                        height: AppDimensions.mobileButtonHeight,
                        horizontalPadding:
                            AppDimensions.mobileButtonHorizontalPadding,
                        iconSize: AppDimensions.mobileButtonIconSize,
                        fontSize: AppDimensions.mobileButtonFontSize,
                        onPressed: () {
                          Navigator.pop(context);
                          onHireMe();
                        },
                      ),
                    ),

                    const SizedBox(height: AppDimensions.spaceLG),

                    Center(child: SocialIcons(onOpen: onOpenSocial)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Brand wordmark plus the cross that dismisses the panel.
class _Header extends StatelessWidget {
  const _Header({required this.onClose});

  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const BrandLogo(),
        const Spacer(),
        MenuToggleButton(isOpen: true, onTap: onClose, tooltip: 'Close menu'),
      ],
    );
  }
}

/// A hairline rule that fades out from the accent color, used to separate the
/// header and footer from the navigation list.
class _AccentDivider extends StatelessWidget {
  const _AccentDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.borderThin,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary.withValues(alpha: 0.5),
            AppColors.border.withValues(alpha: 0.1),
          ],
        ),
      ),
    );
  }
}

/// A single navigation row: numbered like a chapter, marked with an accent bar
/// and a tinted surface while it is active or hovered.
class _DrawerNavTile extends StatelessWidget {
  const _DrawerNavTile({
    required this.item,
    required this.index,
    required this.isActive,
    required this.onTap,
  });

  final NavItem item;
  final int index;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return HoverBuilder(
      onTap: onTap,
      builder: (context, isHovered) {
        final highlighted = isHovered || isActive;

        return AnimatedContainer(
          duration: AppDurations.fast,
          curve: Curves.easeOut,
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.mobileDrawerItemHorizontalPadding,
            vertical: AppDimensions.mobileDrawerItemVerticalPadding,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDimensions.radiusMD),
            color: isActive
                ? AppColors.primary.withValues(alpha: 0.14)
                : isHovered
                ? AppColors.cardHover.withValues(alpha: 0.6)
                : Colors.transparent,
            border: Border.all(
              color: isActive
                  ? AppColors.primaryLight.withValues(alpha: 0.45)
                  : Colors.transparent,
              width: AppDimensions.borderThin,
            ),
          ),
          child: Row(
            children: [
              // Accent bar that grows in on the active / hovered row.
              AnimatedContainer(
                duration: AppDurations.fast,
                curve: Curves.easeOut,
                width: AppDimensions.mobileDrawerActiveBarWidth,
                height: highlighted
                    ? AppDimensions.mobileDrawerActiveBarHeight
                    : 0,
                decoration: BoxDecoration(
                  color: AppColors.primaryLight,
                  borderRadius: BorderRadius.circular(AppDimensions.radiusPill),
                ),
              ),

              const SizedBox(width: AppDimensions.spaceMD),

              Text(
                '0${index + 1}',
                style: AppTextStyle.withColor(
                  AppTextStyle.labelMedium,
                  highlighted ? AppColors.primaryLight : AppColors.textDisabled,
                ).copyWith(fontSize: 12, letterSpacing: 1),
              ),

              const SizedBox(width: AppDimensions.spaceMD),

              AnimatedDefaultTextStyle(
                duration: AppDurations.fast,
                style: AppTextStyle.withColor(
                  AppTextStyle.bodyLarge,
                  highlighted
                      ? AppColors.textPrimary
                      : AppColors.textSecondary,
                ).copyWith(
                  fontWeight: highlighted ? FontWeight.w600 : FontWeight.w500,
                ),
                child: Text(item.label),
              ),

              const Spacer(),

              AnimatedOpacity(
                duration: AppDurations.fast,
                opacity: highlighted ? 1 : 0,
                child: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 12,
                  color: AppColors.primaryLight,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
