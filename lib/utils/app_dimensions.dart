/// Centralized layout constants for the portfolio.
///
/// Every spacing value, radius, and fixed size used across the desktop UI
/// lives here so the design stays consistent and free of magic numbers.
class AppDimensions {
  AppDimensions._();

  // ===========================
  // Global Layout
  // ===========================

  /// Maximum content width for the desktop layout. Content is centered inside
  /// this width so the design never stretches uncomfortably on ultra-wide
  /// monitors.
  static const double maxContentWidth = 1280;

  /// Horizontal padding applied to the outer page shell.
  static const double pageHorizontalPadding = 64;

  /// Height of the fixed top navigation bar.
  static const double navBarHeight = 88;

  // ===========================
  // Spacing Scale (8pt system)
  // ===========================

  static const double spaceXS = 4;
  static const double spaceSM = 8;
  static const double spaceMD = 16;
  static const double spaceLG = 24;
  static const double spaceXL = 32;
  static const double space2XL = 48;
  static const double space3XL = 64;
  static const double space4XL = 96;

  // ===========================
  // Radii
  // ===========================

  static const double radiusSM = 8;
  static const double radiusMD = 12;
  static const double radiusLG = 16;
  static const double radiusXL = 24;
  static const double radiusPill = 999;

  // ===========================
  // Borders
  // ===========================

  static const double borderThin = 1;
  static const double borderThick = 1.5;

  // ===========================
  // Navigation
  // ===========================

  static const double navItemSpacing = 32;
  static const double navItemVerticalPadding = 8;
  static const double navItemHorizontalPadding = 4;

  // ===========================
  // Buttons
  // ===========================

  static const double buttonHeight = 54;
  static const double buttonHorizontalPadding = 28;
  static const double buttonIconGap = 10;

  // ===========================
  // Hero
  // ===========================

  static const double heroBadgeVerticalPadding = 8;
  static const double heroBadgeHorizontalPadding = 16;
  static const double heroLeftMaxWidth = 620;
  static const double heroColumnGap = 48;

  /// Diameter of the circular profile image on the hero right side.
  static const double profileImageSize = 380;

  /// Thickness of the glowing ring around the profile image.
  static const double profileRingWidth = 3;

  /// How far (in logical pixels) the profile image floats up and down.
  static const double profileFloatAmplitude = 14;

  // ===========================
  // Social Icons
  // ===========================

  static const double socialIconSize = 44;
  static const double socialIconGlyphSize = 18;
  static const double socialIconSpacing = 14;

  // ===========================
  // Availability Badge
  // ===========================

  static const double availabilityDotSize = 10;

  // ===========================
  // Tablet Layout
  // ===========================

  /// Maximum content width for tablet layout.
  static const double tabletMaxContentWidth = 900;

  /// Horizontal padding for tablet screens.
  static const double tabletHorizontalPadding = 24;

  /// Navigation item spacing on tablet.
  static const double tabletNavItemSpacing = 8;

  /// Tablet navbar height.
  static const double tabletNavBarHeight = 80;

  // ===========================
  // Tablet Hero
  // ===========================

  static const double tabletHeroLeftMaxWidth = 460;

  static const double tabletHeroColumnGap = 32;

  static const double tabletProfileImageSize = 300;

  // ===========================
  // Tablet Buttons
  // ===========================

  static const double tabletButtonHeight = 46;

  static const double tabletButtonHorizontalPadding = 20;

  // ===========================
  // Tablet Social Icons
  // ===========================

  static const double tabletSocialIconSize = 40;

  static const double tabletSocialIconGlyphSize = 16;

  // Mobile Hero
  static const double mobileProfileImageSize = 220;
}
