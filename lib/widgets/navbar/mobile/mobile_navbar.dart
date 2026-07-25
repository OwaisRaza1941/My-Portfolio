import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../utils/app_color.dart';
import '../../../utils/app_dimensions.dart';
import '../desktop/brand_logo.dart';
import 'menu_toggle_button.dart';

/// The sticky top bar on phones: brand wordmark on the left, a glass
/// menu / close toggle on the right.
///
/// The bar is a frosted translucent panel so the animated background stays
/// visible behind it, capped by a hairline border that fades into the page.
class MobileNavbar extends StatelessWidget {
  const MobileNavbar({
    super.key,
    required this.onMenuTap,
    required this.onLogoTap,
    this.isDrawerOpen = false,
  });

  /// Opens (or closes) the navigation drawer.
  final VoidCallback onMenuTap;

  final VoidCallback onLogoTap;

  /// Drives the hamburger → cross morph on the toggle button.
  final bool isDrawerOpen;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: Container(
          height: AppDimensions.mobileNavBarHeight,
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.mobileHorizontalPadding,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.scaffoldBackground.withValues(alpha: 0.72),
                AppColors.scaffoldBackground.withValues(alpha: 0.45),
              ],
            ),
            border: Border(
              bottom: BorderSide(
                color: AppColors.border.withValues(alpha: 0.6),
                width: AppDimensions.borderThin,
              ),
            ),
          ),
          child: Row(
            children: [
              BrandLogo(onTap: onLogoTap),
              const Spacer(),
              MenuToggleButton(
                isOpen: isDrawerOpen,
                onTap: onMenuTap,
                tooltip: isDrawerOpen ? 'Close menu' : 'Menu',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
