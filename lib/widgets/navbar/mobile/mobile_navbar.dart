import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:portfolio/models/nav_item.dart';
import 'package:portfolio/utils/app_color.dart';
import 'package:portfolio/utils/app_dimensions.dart';
import 'package:portfolio/widgets/navbar/desktop/brand_logo.dart';

class MobileNavbar extends StatelessWidget {
  const MobileNavbar({
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

  @override
  Widget build(BuildContext context) {
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
              constraints: const BoxConstraints(maxWidth: double.infinity),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    BrandLogo(onTap: onLogoTap),

                    const Spacer(),

                    IconButton(
                      onPressed: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                      icon: const Icon(
                        Icons.menu_rounded,
                        color: AppColors.textPrimary,
                        size: 28,
                      ),
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
