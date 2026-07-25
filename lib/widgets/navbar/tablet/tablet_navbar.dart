import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/models/nav_item.dart';
import 'package:portfolio/utils/app_color.dart';
import 'package:portfolio/utils/app_dimensions.dart';
import 'package:portfolio/utils/app_strings.dart';
import 'package:portfolio/widgets/buttons/primary_button.dart';
import 'package:portfolio/widgets/navbar/desktop/brand_logo.dart';
import 'package:portfolio/widgets/navbar/desktop/nav_link.dart';
import 'package:portfolio/widgets/navbar/mobile/menu_toggle_button.dart';

class TabletNavbar extends StatelessWidget {
  const TabletNavbar({
    super.key,
    required this.onNavItemTap,
    required this.onHireMe,
    required this.onLogoTap,
    required this.onMenuTap,
    this.isDrawerOpen = false,
    this.activeAnchor,
  });

  /// Called with the tapped item's anchor so the parent can scroll to it.
  final ValueChanged<NavItem> onNavItemTap;
  final VoidCallback onHireMe;
  final VoidCallback onLogoTap;

  /// Opens (or closes) the navigation drawer on the compact tablet width.
  final VoidCallback onMenuTap;

  /// Drives the hamburger → cross morph on the toggle button.
  final bool isDrawerOpen;

  /// Anchor of the section currently in view, highlighted in the bar.
  final String? activeAnchor;

  /// Below this width the inline links stop fitting, so the bar collapses into
  /// the drawer toggle.
  static const double compactBreakpoint = 900;

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
    final width = MediaQuery.sizeOf(context).width;
    final bool showHamburger = width < compactBreakpoint;
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: Container(
          height: AppDimensions.tabletNavBarHeight,
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
                maxWidth: AppDimensions.tabletMaxContentWidth,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.tabletHorizontalPadding,
                ),
                child: Row(
                  children: [
                    BrandLogo(onTap: onLogoTap),

                    const Spacer(),

                    if (showHamburger)
                      MenuToggleButton(
                        isOpen: isDrawerOpen,
                        onTap: onMenuTap,
                        tooltip: isDrawerOpen ? 'Close menu' : 'Menu',
                      )
                    else ...[
                      _NavLinks(
                        items: _items,
                        activeAnchor: activeAnchor,
                        onNavItemTap: onNavItemTap,
                      ),

                      const SizedBox(width: 20),

                      SizedBox(
                        height: 46,
                        child: PrimaryButton(
                          label: AppStrings.hireMe,
                          onPressed: onHireMe,
                        ),
                      ),
                    ],
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
