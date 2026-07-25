import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../models/nav_item.dart';
import '../../../utils/app_color.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/app_strings.dart';
import '../../buttons/primary_button.dart';
import 'brand_logo.dart';
import 'nav_link.dart';

/// The transparent, blurred top navigation bar for the desktop layout.
///
/// It contains the brand logo, the primary section links, and the "Hire Me"
/// call-to-action. The bar itself is a translucent glass strip so the animated
/// background subtly shows through while keeping the links readable.
class DesktopNavbar extends StatelessWidget {
  const DesktopNavbar({
    super.key,
    required this.onNavItemTap,
    required this.onHireMe,
    required this.onLogoTap,
    this.activeAnchor,
  });

  /// Called with the tapped item's anchor so the parent can scroll to it.
  final ValueChanged<NavItem> onNavItemTap;
  final VoidCallback onHireMe;
  final VoidCallback onLogoTap;

  /// Anchor of the section currently in view, highlighted in the bar.
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

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: Container(
          height: AppDimensions.navBarHeight,
          decoration: BoxDecoration(
            color: AppColors.scaffoldBackground.withValues(alpha: 0.55),
            border: Border(
              bottom: BorderSide(
                color: AppColors.border.withValues(alpha: 0.6),
                width: AppDimensions.borderThin,
              ),
            ),
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: AppDimensions.maxContentWidth,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.pageHorizontalPadding,
                ),
                child: Row(
                  children: [
                    BrandLogo(onTap: onLogoTap),
                    const Spacer(),
                    _NavLinks(
                      items: _items,
                      activeAnchor: activeAnchor,
                      onNavItemTap: onNavItemTap,
                    ),
                    const SizedBox(width: AppDimensions.space2XL),
                    PrimaryButton(
                      label: AppStrings.hireMe,
                      onPressed: onHireMe,
                    ),
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

/// The horizontal row of navigation links.
class _NavLinks extends StatelessWidget {
  const _NavLinks({
    required this.items,
    required this.activeAnchor,
    required this.onNavItemTap,
  });

  final List<NavItem> items;
  final String? activeAnchor;
  final ValueChanged<NavItem> onNavItemTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final item in items)
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.navItemSpacing / 2,
            ),
            child: NavLink(
              label: item.label,
              isActive: item.anchor == activeAnchor,
              onTap: () => onNavItemTap(item),
            ),
          ),
      ],
    );
  }
}
