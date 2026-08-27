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
  // About Section (Desktop)
  // ===========================

  /// Vertical breathing room above and below the whole about section.
  static const double aboutSectionVerticalPadding = space4XL;

  /// Gap between the illustration column and the content column.
  static const double aboutColumnGap = space3XL;

  /// Width cap for the centered header block, so the subtitle wraps into a
  /// balanced two-line paragraph instead of one very wide line.
  static const double aboutHeaderMaxWidth = 720;

  /// Space between the centered header and the two-column body.
  static const double aboutHeaderBottomGap = space4XL;

  // ===========================
  // About Typography
  // ===========================

  static const double aboutTitleFontSize = 44;
  static const double aboutSubtitleFontSize = 17;
  static const double aboutHeadlineFontSize = 28;
  static const double aboutBodyFontSize = 15;

  // ===========================
  // About Illustration (code window)
  // ===========================

  /// Preferred width of the code-window illustration. Treated as a maximum so
  /// the window shrinks with its column instead of overflowing.
  static const double aboutIllustrationMaxWidth = 520;

  /// Breathing room around the window, reserved for its glow and the floating
  /// tech badges that hang off its edges.
  static const double aboutIllustrationPadding = space2XL;

  static const double aboutCodeWindowRadius = 18;

  /// Height of the faux title bar with the traffic-light dots.
  static const double aboutCodeWindowChromeHeight = 44;

  static const double aboutCodeWindowPadding = spaceLG;

  /// Diameter of a single traffic-light dot.
  static const double aboutWindowDotSize = 11;

  static const double aboutWindowDotSpacing = spaceSM;

  /// Width of the line-number gutter beside the snippet.
  static const double aboutCodeGutterWidth = 32;

  /// Height of one rendered code line.
  static const double aboutCodeLineHeight = 24;

  /// Width and height of the blinking caret after the last line.
  static const double aboutCaretWidth = 7;
  static const double aboutCaretHeight = 15;

  // ===========================
  // About Tech Badges
  // ===========================

  static const double aboutTechBadgeIconSize = 15;

  /// How far the floating badges overhang the window edge.
  static const double aboutTechBadgeOverhang = spaceXL;

  // ===========================
  // About Highlight Tiles
  // ===========================

  /// Gap between highlight tiles, both horizontally and vertically.
  static const double aboutHighlightGap = spaceMD;

  /// Below this tile width the 2-up grid collapses to a single column.
  static const double aboutHighlightMinTileWidth = 210;

  static const double aboutHighlightIconBoxSize = 40;
  static const double aboutHighlightIconSize = 18;
  static const double aboutHighlightTitleFontSize = 15;
  static const double aboutHighlightBodyFontSize = 13;

  // ===========================
  // About Stats
  // ===========================

  static const double aboutStatGap = spaceLG;
  static const double aboutStatValueFontSize = 30;
  static const double aboutStatLabelFontSize = 13;

  /// Height of the thin vertical rule between two stats.
  static const double aboutStatDividerHeight = 40;

  // ===========================
  // Services Section (Desktop)
  // ===========================

  /// Vertical breathing room above and below the whole services section.
  static const double servicesSectionVerticalPadding = space4XL;

  /// Space between the centered header and the card grid.
  static const double servicesHeaderBottomGap = space3XL;

  /// Width cap for the centered header block.
  static const double servicesHeaderMaxWidth = 720;

  /// Gap between service cards, both horizontally and vertically.
  static const double servicesGridGap = spaceLG;

  /// Below this card width the grid drops one column.
  static const double servicesMinCardWidth = 320;

  /// Most columns the grid will ever use, whatever the available width.
  static const int servicesMaxColumns = 3;

  // ===========================
  // Service Card
  // ===========================

  static const double serviceCardPadding = spaceXL - 4;
  static const double serviceCardRadius = radiusXL - 4;
  static const double serviceCardIconBoxSize = 56;
  static const double serviceCardIconSize = 26;
  static const double serviceCardTitleFontSize = 19;
  static const double serviceCardBodyFontSize = 14;

  /// The faint "01" watermark sitting in the card's top-right corner.
  static const double serviceCardIndexFontSize = 40;

  /// Space between the icon row and the title.
  static const double serviceCardIconGap = spaceLG - 4;

  /// Space between the description and the feature list.
  static const double serviceCardFeatureGap = spaceMD + spaceXS;

  /// Vertical rhythm between two feature rows.
  static const double serviceFeatureRowGap = spaceSM + 2;

  static const double serviceFeatureFontSize = 13;
  static const double serviceFeatureIconSize = 15;
  static const double serviceFeatureIconGap = spaceSM + 2;

  /// How far a hovered card lifts off the page.
  static const double serviceCardHoverLift = 8;

  /// Thickness of the accent rail that sweeps across the card top on hover.
  static const double serviceCardAccentBarHeight = 3;

  // ===========================
  // Services Call To Action
  // ===========================

  /// Space between the card grid and the closing CTA panel.
  static const double servicesCtaTopGap = space3XL;

  static const double servicesCtaPadding = space2XL - 8;

  static const double servicesCtaRadius = radiusXL;

  static const double servicesCtaTitleFontSize = 24;

  static const double servicesCtaBodyFontSize = 14.5;

  /// Width cap for the CTA copy, so it never runs the full panel width.
  static const double servicesCtaTextMaxWidth = 560;

  /// Below this panel width the CTA stacks its copy above the button.
  static const double servicesCtaStackBreakpoint = 720;

  // ===========================
  // Projects Section (Desktop)
  // ===========================

  /// Vertical breathing room above and below the whole projects section.
  static const double projectsSectionVerticalPadding = space4XL;

  /// Space between the centered header and the first showcase row.
  static const double projectsHeaderBottomGap = space3XL;

  /// Width cap for the centered header block.
  static const double projectsHeaderMaxWidth = 720;

  // ===========================
  // Projects Grid
  // ===========================

  /// Narrowest a grid tile may get before the row drops a column — the grid
  /// picks `floor(width / minTileWidth)` columns, clamped to
  /// [projectsGridMaxColumns].
  static const double projectsGridMinTileWidth = 300;

  /// Most columns the grid ever shows, so ultra-wide desktops don't stretch
  /// six cards into a single thin row.
  static const int projectsGridMaxColumns = 3;

  /// Gap between grid tiles, both across and down.
  static const double projectsGridSpacing = spaceXL;

  // ===========================
  // Project Card
  // ===========================

  /// Thumbnail aspect ratio for a mobile-app screenshot — portrait, close to
  /// a phone screen, so the shot fills the frame without a heavy crop.
  static const double projectCardImageAppAspectRatio = 3 / 4;

  /// Thumbnail aspect ratio for a website screenshot — landscape, matching a
  /// browser viewport.
  static const double projectCardImageWebsiteAspectRatio = 16 / 9;

  static const double projectCardRadius = radiusXL - 4;
  static const double projectCardPadding = spaceLG;

  /// How far a hovered card lifts off the page.
  static const double projectCardHoverLift = 6;

  /// How much the thumbnail scales up on hover, hinting it's tappable to zoom.
  static const double projectCardImageHoverScale = 1.06;

  static const double projectCardCategoryFontSize = 11.5;
  static const double projectCardTitleFontSize = 19;
  static const double projectCardBodyFontSize = 13.5;
  static const double projectCardChipFontSize = 11;

  /// Space between the category label and the title.
  static const double projectCardCategoryGap = spaceSM;

  /// Space between blocks inside the card body.
  static const double projectCardContentGap = spaceMD;

  /// Gap between the two action buttons.
  static const double projectCardActionGap = spaceSM + 2;

  static const double projectCardActionButtonHeight = 40;
  static const double projectCardActionFontSize = 13;

  /// Compact horizontal padding for the two action buttons, so "View Code"
  /// and "Live Demo" both sit on one line instead of wrapping.
  static const double projectCardActionHorizontalPadding = spaceMD;
  static const double projectCardActionIconSize = 14;

  // ===========================
  // Project Image Zoom
  // ===========================

  /// Widest the zoomed image may grow, so it stays readable rather than
  /// stretching edge-to-edge on ultra-wide monitors.
  static const double projectZoomMaxWidth = 900;

  /// Fraction of the viewport height the zoomed image may fill.
  static const double projectZoomMaxHeightFraction = 0.82;

  /// Breathing room around the zoomed image inside the blurred backdrop.
  static const double projectZoomPadding = spaceXL;

  static const double projectZoomRadius = radiusLG;

  /// Full backdrop blur strength once the zoom view has finished opening.
  static const double projectZoomBlurSigma = 22;

  static const double projectZoomCloseButtonSize = 44;

  /// Space between the last grid row and the closing GitHub panel.
  static const double projectsFooterTopGap = space3XL;

  static const double projectsFooterPadding = space2XL - 8;
  static const double projectsFooterTitleFontSize = 24;
  static const double projectsFooterBodyFontSize = 14.5;

  // ===========================
  // Contact Section (Desktop)
  // ===========================

  /// Vertical breathing room above and below the whole contact section.
  static const double contactSectionVerticalPadding = space4XL;

  /// Space between the centered header and the two-column body.
  static const double contactHeaderBottomGap = space3XL;

  /// Width cap for the centered header block.
  static const double contactHeaderMaxWidth = 720;

  /// Gap between the info column and the form card.
  static const double contactColumnGap = space3XL;

  /// Below this section width the info column and the form stack instead of
  /// sitting side by side — the form's two-up name/email row would otherwise
  /// squeeze under a readable field width.
  static const double contactStackBreakpoint = 900;

  /// How the horizontal space is split between the info column and the form.
  static const int contactInfoFlex = 4;
  static const int contactFormFlex = 5;

  // ===========================
  // Contact Info Column
  // ===========================

  static const double contactInfoHeadlineFontSize = 26;
  static const double contactInfoBodyFontSize = 14.5;

  /// Width cap for the intro paragraph in the info column.
  static const double contactInfoBodyMaxWidth = 460;

  /// Vertical rhythm between two info tiles.
  static const double contactInfoTileGap = spaceMD;

  static const double contactInfoTilePadding = spaceMD + spaceXS;
  static const double contactInfoTileRadius = radiusLG;
  static const double contactInfoIconBoxSize = 46;
  static const double contactInfoIconSize = 20;
  static const double contactInfoLabelFontSize = 12.5;
  static const double contactInfoValueFontSize = 14.5;

  /// How far a hovered (tappable) info tile lifts off the page.
  static const double contactInfoTileHoverLift = 4;

  /// Space above the "find me online" block at the bottom of the column.
  static const double contactSocialsTopGap = spaceXL;

  // ===========================
  // Contact Form
  // ===========================

  static const double contactFormPadding = space2XL - 8;
  static const double contactFormRadius = radiusXL;
  static const double contactFormTitleFontSize = 22;

  /// Space between the form title and the first field.
  static const double contactFormTitleGap = spaceLG;

  /// Vertical rhythm between two fields.
  static const double contactFieldGap = spaceMD + spaceXS;

  /// Gap between the name and email fields when they share a row.
  static const double contactFieldRowGap = spaceMD;

  /// Below this form width the name and email fields stop sharing a row.
  static const double contactFieldRowBreakpoint = 460;

  static const double contactFieldRadius = radiusMD;
  static const double contactFieldLabelFontSize = 13;
  static const double contactFieldFontSize = 14.5;

  /// Space between a field's label and its input box.
  static const double contactFieldLabelGap = spaceSM;

  static const double contactFieldHorizontalPadding = spaceMD;
  static const double contactFieldVerticalPadding = spaceMD - 2;

  /// Lines the message box shows before it starts scrolling.
  static const int contactMessageLines = 5;

  /// Space between the last field and the send button.
  static const double contactSendTopGap = spaceLG;

  static const double contactFormNoteFontSize = 12.5;

  // ===========================
  // Skills Section (Desktop)
  // ===========================

  /// Vertical breathing room above and below the whole skills section.
  static const double skillsSectionVerticalPadding = space4XL;

  /// Space between the centered header and the card grid.
  static const double skillsHeaderBottomGap = space3XL;

  /// Width cap for the centered header block.
  static const double skillsHeaderMaxWidth = 720;

  /// Gap between skill cards, both horizontally and vertically.
  static const double skillsGridGap = spaceLG;

  /// Below this card width the grid drops one column.
  static const double skillsMinCardWidth = 300;

  /// Most columns the grid will ever use, whatever the available width.
  static const int skillsMaxColumns = 3;

  // ===========================
  // Skills Card
  // ===========================

  static const double skillsCardPadding = spaceLG;
  static const double skillsCardRadius = radiusXL - 4;
  static const double skillsCardIconBoxSize = 46;
  static const double skillsCardIconSize = 21;
  static const double skillsCardTitleFontSize = 16.5;

  /// Space between the card header row and the chip cloud.
  static const double skillsCardHeaderGap = spaceMD + spaceXS;

  /// How far a hovered card lifts off the page.
  static const double skillsCardHoverLift = 6;

  // ===========================
  // Skills Chips
  // ===========================

  static const double skillsChipSpacing = spaceSM;
  static const double skillsChipRunSpacing = spaceSM + 2;
  static const double skillsChipHorizontalPadding = spaceMD - 4;
  static const double skillsChipVerticalPadding = spaceSM - 1;
  static const double skillsChipFontSize = 12.5;

  /// Diameter of the accent dot that leads each chip label.
  static const double skillsChipDotSize = 5;
  static const double skillsChipDotGap = spaceSM;

  // ===========================
  // Social Icons
  // ===========================

  static const double socialIconSize = 44;
  static const double socialIconGlyphSize = 18;
  static const double socialIconSpacing = 14;

  /// Width for image-backed marks (Fiverr). The asset is a ~3.3:1 wordmark, so
  /// it is sized by width instead of the square glyph size.
  static const double socialIconImageWidth = 30;

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

  /// Breathing room around the tablet portrait, so its outer glow and the
  /// floating availability badge aren't clipped by the column edge.
  static const double tabletProfilePadding = 32;

  // ===========================
  // Tablet Hero Typography
  // ===========================

  /// The desktop scale (66/34/26) overflows once the text column drops to the
  /// tablet width, so the hero steps down a notch here.
  static const double tabletHeroNameFontSize = 46;

  static const double tabletHeroRoleFontSize = 26;

  static const double tabletHeroHeadlineFontSize = 20;

  static const double tabletHeroGreetingFontSize = 17;

  static const double tabletHeroDescriptionFontSize = 15;

  // ===========================
  // Tablet Buttons
  // ===========================

  static const double tabletButtonHeight = 46;

  static const double tabletButtonHorizontalPadding = 20;

  static const double tabletButtonFontSize = 15;

  static const double tabletButtonIconSize = 17;

  // ===========================
  // Tablet Social Icons
  // ===========================

  static const double tabletSocialIconSize = 40;

  static const double tabletSocialIconGlyphSize = 16;

  // ===========================
  // Tablet About
  // ===========================

  /// The desktop about section runs the illustration and the prose side by
  /// side. On the tablet measure that would squeeze the code window below
  /// readability, so the tablet layout stacks them and caps the column instead.
  static const double tabletAboutMaxWidth = 700;

  static const double tabletAboutSectionVerticalPadding = space3XL;

  static const double tabletAboutHeaderBottomGap = space2XL;

  /// Space between the stacked illustration and the content column.
  static const double tabletAboutStackGap = space2XL;

  static const double tabletAboutHeaderMaxWidth = 600;

  static const double tabletAboutIllustrationMaxWidth = 460;

  static const double tabletAboutIllustrationPadding = spaceXL;

  // ===========================
  // Tablet About Typography
  // ===========================

  static const double tabletAboutTitleFontSize = 34;

  static const double tabletAboutSubtitleFontSize = 15.5;

  static const double tabletAboutHeadlineFontSize = 24;

  static const double tabletAboutBodyFontSize = 14.5;

  static const double tabletAboutStatValueFontSize = 26;

  // ===========================
  // Tablet About Code Window
  // ===========================

  static const double tabletAboutCodeFontSize = 12;

  static const double tabletAboutCodePadding = spaceMD + spaceXS;

  static const double tabletAboutCodeLineHeight = 22;

  // ===========================
  // Tablet Skills
  // ===========================

  /// Same measure as the tablet about column, so both sections share one edge.
  static const double tabletSkillsMaxWidth = 700;

  static const double tabletSkillsSectionVerticalPadding = space3XL;

  static const double tabletSkillsHeaderBottomGap = space2XL;

  static const double tabletSkillsHeaderMaxWidth = 600;

  static const double tabletSkillsGridGap = spaceMD;

  /// Two columns on the tablet measure: 700 minus the page padding and the gap
  /// leaves ~310 per card, which still holds the longest chips two per row.
  static const int tabletSkillsMaxColumns = 2;

  /// Low enough that the grid keeps two columns down to the compact tablet
  /// width instead of collapsing early.
  static const double tabletSkillsMinCardWidth = 240;

  static const double tabletSkillsCardPadding = spaceMD + spaceXS;

  static const double tabletSkillsCardTitleFontSize = 15.5;

  static const double tabletSkillsChipFontSize = 12;

  // ===========================
  // Tablet Services
  // ===========================

  /// Same measure as the tablet about and skills columns, so every section
  /// keeps one edge down the page.
  static const double tabletServicesMaxWidth = 700;

  static const double tabletServicesSectionVerticalPadding = space3XL;

  static const double tabletServicesHeaderBottomGap = space2XL;

  static const double tabletServicesHeaderMaxWidth = 600;

  static const double tabletServicesGridGap = spaceMD;

  /// Two columns on the tablet measure: 700 minus the page padding and the gap
  /// leaves ~310 per card, which still holds the feature lines on one line
  /// each. Three would drop them to ~195 and wrap every deliverable.
  static const int tabletServicesMaxColumns = 2;

  /// Low enough that the grid keeps two columns down to the compact tablet
  /// width instead of collapsing early.
  static const double tabletServicesMinCardWidth = 240;

  static const double tabletServicesCardPadding = spaceLG;

  static const double tabletServicesCardTitleFontSize = 17;

  static const double tabletServicesCardBodyFontSize = 13.5;

  static const double tabletServicesFeatureFontSize = 12.5;

  static const double tabletServicesCardIconBoxSize = 48;

  static const double tabletServicesCardIconSize = 22;

  static const double tabletServicesCardIndexFontSize = 32;

  static const double tabletServicesCtaTopGap = space2XL;

  static const double tabletServicesCtaPadding = spaceXL;

  static const double tabletServicesCtaTitleFontSize = 21;

  static const double tabletServicesCtaBodyFontSize = 13.5;

  // ===========================
  // Projects Section (Tablet)
  // ===========================

  /// Width cap for the whole projects column on tablets, matching the services
  /// measure so both sections share one page edge.
  static const double tabletProjectsMaxWidth = 700;

  static const double tabletProjectsSectionVerticalPadding = space3XL;

  static const double tabletProjectsHeaderBottomGap = space2XL;

  static const double tabletProjectsHeaderMaxWidth = 600;

  /// Space between the last grid row and the closing GitHub panel.
  static const double tabletProjectsFooterTopGap = space2XL;
  static const double tabletProjectsFooterPadding = spaceXL;
  static const double tabletProjectsFooterTitleFontSize = 21;
  static const double tabletProjectsFooterBodyFontSize = 13.5;

  // ===========================
  // Contact Section (Tablet)
  // ===========================

  /// Same measure as the tablet services and projects columns, so every section
  /// keeps one edge down the page.
  static const double tabletContactMaxWidth = 700;

  static const double tabletContactSectionVerticalPadding = space3XL;

  static const double tabletContactHeaderBottomGap = space2XL;

  static const double tabletContactHeaderMaxWidth = 600;

  /// Gap between the info column and the form card. The tablet measure always
  /// sits below [contactStackBreakpoint], so the two never share a row.
  static const double tabletContactColumnGap = space2XL;

  static const double tabletContactInfoHeadlineFontSize = 22;
  static const double tabletContactInfoBodyFontSize = 13.5;
  static const double tabletContactInfoTileGap = spaceSM + 2;

  static const double tabletContactInfoTilePadding = spaceMD;
  static const double tabletContactInfoIconBoxSize = 42;
  static const double tabletContactInfoIconSize = 19;
  static const double tabletContactInfoLabelFontSize = 11.5;
  static const double tabletContactInfoValueFontSize = 13.5;

  static const double tabletContactFormPadding = spaceXL;
  static const double tabletContactFormTitleFontSize = 20;
  static const double tabletContactFieldLabelFontSize = 12.5;
  static const double tabletContactFieldFontSize = 14;

  // Mobile Hero
  static const double mobileProfileImageSize = 220;

  // ===========================
  // Mobile Hero Typography
  // ===========================

  /// Font sizes for the hero text column on phones. The desktop scale is far
  /// too large once the column drops to full-bleed width.
  static const double mobileHeroNameFontSize = 36;

  static const double mobileHeroRoleFontSize = 20;

  static const double mobileHeroHeadlineFontSize = 17;

  static const double mobileHeroGreetingFontSize = 15;

  static const double mobileHeroDescriptionFontSize = 13.5;

  // ===========================
  // Mobile Navigation
  // ===========================

  /// Height of the sticky top bar on phones. Slightly shorter than the tablet
  /// bar so the hero keeps more vertical room.
  static const double mobileNavBarHeight = 72;

  /// Horizontal padding of the mobile nav bar and drawer content.
  static const double mobileHorizontalPadding = 20;

  /// Size of the square glass menu / close toggle in the nav bar.
  static const double mobileMenuButtonSize = 42;

  /// Glyph size inside the menu / close toggle.
  static const double mobileMenuIconSize = 22;

  // ===========================
  // Mobile Drawer
  // ===========================

  /// Preferred drawer width. Clamped against the screen width at build time so
  /// it never covers the whole viewport on small phones.
  static const double mobileDrawerWidth = 320;

  /// Fraction of the screen the drawer may occupy at most.
  static const double mobileDrawerWidthFactor = 0.86;

  /// Vertical padding of a single drawer nav row.
  static const double mobileDrawerItemVerticalPadding = 14;

  /// Horizontal padding of a single drawer nav row.
  static const double mobileDrawerItemHorizontalPadding = 14;

  /// Gap between two drawer nav rows.
  static const double mobileDrawerItemGap = 6;

  /// Width of the accent bar that marks the active drawer row.
  static const double mobileDrawerActiveBarWidth = 3;

  /// Height of the accent bar that marks the active drawer row.
  static const double mobileDrawerActiveBarHeight = 20;

  // ===========================
  // Mobile Buttons
  // ===========================

  /// The desktop 54px pill is too heavy on phones and the two hero actions
  /// stop fitting side by side, so the mobile scale trims height, padding,
  /// and glyph size.
  static const double mobileButtonHeight = 44;

  static const double mobileButtonHorizontalPadding = 16;

  static const double mobileButtonFontSize = 14;

  static const double mobileButtonIconSize = 16;

  // ===========================
  // Mobile About
  // ===========================

  /// Matches the mobile hero's measure so both sections share one column edge.
  static const double mobileAboutMaxWidth = 500;

  static const double mobileAboutHorizontalPadding = 15;

  static const double mobileAboutSectionVerticalPadding = space2XL;

  static const double mobileAboutHeaderBottomGap = spaceXL;

  /// Space between the stacked illustration and the content column.
  static const double mobileAboutStackGap = spaceXL;

  static const double mobileAboutIllustrationMaxWidth = 340;

  /// A little tighter than [aboutTechBadgeOverhang]: the floating stack badges
  /// spill 12px past this box, which the page's own side padding absorbs. Every
  /// pixel saved here goes to the code window, which is the tightest thing on
  /// the page at phone widths.
  static const double mobileAboutIllustrationPadding = spaceMD + spaceXS;

  // ===========================
  // Mobile About Typography
  // ===========================

  static const double mobileAboutTitleFontSize = 27;

  static const double mobileAboutSubtitleFontSize = 13.5;

  static const double mobileAboutHeadlineFontSize = 20;

  static const double mobileAboutBodyFontSize = 13.5;

  static const double mobileAboutStatValueFontSize = 22;

  static const double mobileAboutStatLabelFontSize = 11;

  /// The desktop 24pt stat gutter eats most of a phone's width once both
  /// dividers are counted, so the mobile strip tightens right down.
  static const double mobileAboutStatGap = spaceSM;

  // ===========================
  // Mobile About Code Window
  // ===========================

  /// Sized so the snippet's longest line clears a 360pt phone without
  /// truncating. It is decorative rather than something to read line by line,
  /// so legibility of the shape matters more than of the individual glyph.
  static const double mobileAboutCodeFontSize = 9;

  static const double mobileAboutCodePadding = spaceSM + spaceXS;

  static const double mobileAboutCodeLineHeight = 16;

  /// The 32pt desktop gutter is sized for 13pt digits; at the phone's snippet
  /// size it would swallow width the longest code line needs.
  static const double mobileAboutCodeGutterWidth = 18;

  static const double mobileAboutCodeGutterGap = spaceXS + 2;

  // ===========================
  // Mobile Skills
  // ===========================

  /// Matches [mobileAboutMaxWidth] so the hero, about and skills columns all
  /// share one edge down the page.
  static const double mobileSkillsMaxWidth = 500;

  static const double mobileSkillsHorizontalPadding = 15;

  static const double mobileSkillsSectionVerticalPadding = space2XL;

  static const double mobileSkillsHeaderBottomGap = spaceXL;

  static const double mobileSkillsGridGap = spaceMD;

  /// Phones get one card per row — two columns would leave the longest chips
  /// ("Firebase Realtime Database") wrapping onto three lines each.
  static const int mobileSkillsMaxColumns = 1;

  static const double mobileSkillsCardPadding = spaceMD;

  static const double mobileSkillsCardTitleFontSize = 14.5;

  static const double mobileSkillsChipFontSize = 11.5;

  /// The card glyph square steps down with the type scale around it.
  static const double mobileSkillsCardIconBoxSize = 40;

  static const double mobileSkillsCardIconSize = 19;

  // ===========================
  // Mobile Services
  // ===========================

  /// Matches [mobileSkillsMaxWidth] so the hero, about, skills and services
  /// columns all share one edge down the page.
  static const double mobileServicesMaxWidth = 500;

  static const double mobileServicesHorizontalPadding = 15;

  static const double mobileServicesSectionVerticalPadding = space2XL;

  static const double mobileServicesHeaderBottomGap = spaceXL;

  static const double mobileServicesGridGap = spaceMD;

  /// Phones get one card per row — a second column would leave the longest
  /// deliverables ("Android & iOS from one codebase") wrapping to three lines.
  static const int mobileServicesMaxColumns = 1;

  static const double mobileServicesCardPadding = spaceMD + spaceXS;

  static const double mobileServicesCardTitleFontSize = 16;

  static const double mobileServicesCardBodyFontSize = 13;

  static const double mobileServicesFeatureFontSize = 12;

  /// The card glyph square steps down with the type scale around it.
  static const double mobileServicesCardIconBoxSize = 44;

  static const double mobileServicesCardIconSize = 20;

  static const double mobileServicesCardIndexFontSize = 28;

  static const double mobileServicesCtaTopGap = spaceXL;

  static const double mobileServicesCtaPadding = spaceLG;

  static const double mobileServicesCtaTitleFontSize = 19;

  static const double mobileServicesCtaBodyFontSize = 13;

  // ===========================
  // Projects Section (Mobile)
  // ===========================

  /// Width cap for the projects column on phones, matching the mobile services
  /// measure so both sections share one page edge.
  static const double mobileProjectsMaxWidth = 500;

  static const double mobileProjectsHorizontalPadding = 15;

  static const double mobileProjectsSectionVerticalPadding = space2XL;

  static const double mobileProjectsHeaderBottomGap = spaceXL;

  /// Space between the last grid row and the closing GitHub panel.
  static const double mobileProjectsFooterTopGap = spaceXL;
  static const double mobileProjectsFooterPadding = spaceLG;
  static const double mobileProjectsFooterTitleFontSize = 19;
  static const double mobileProjectsFooterBodyFontSize = 13;

  // ===========================
  // Contact Section (Mobile)
  // ===========================

  /// Width cap for the contact column on phones, matching the mobile services
  /// and projects measure so every section shares one page edge.
  static const double mobileContactMaxWidth = 500;

  static const double mobileContactHorizontalPadding = 15;

  static const double mobileContactSectionVerticalPadding = space2XL;

  static const double mobileContactHeaderBottomGap = spaceXL;

  /// Gap between the info column and the form card underneath it.
  static const double mobileContactColumnGap = spaceXL;

  static const double mobileContactInfoHeadlineFontSize = 20;
  static const double mobileContactInfoBodyFontSize = 13;
  static const double mobileContactInfoTileGap = spaceSM + 2;

  /// The phone tile keeps its padding but trims the glyph square, which is what
  /// squeezes the value line ("owais.raza…@gmail.com") on a 360pt screen.
  static const double mobileContactInfoTilePadding = spaceMD;
  static const double mobileContactInfoIconBoxSize = 38;
  static const double mobileContactInfoIconSize = 18;
  static const double mobileContactInfoLabelFontSize = 11;
  static const double mobileContactInfoValueFontSize = 13;

  static const double mobileContactFormPadding = spaceLG;
  static const double mobileContactFormTitleFontSize = 18;
  static const double mobileContactFieldLabelFontSize = 12;
  static const double mobileContactFieldFontSize = 13.5;

  /// One line fewer than desktop — the phone message box is already the tallest
  /// thing in the section.
  static const int mobileContactMessageLines = 4;

  // ===========================
  // Scroll To Top Button
  // ===========================

  /// Diameter of the floating "back to top" button, per breakpoint.
  static const double scrollTopButtonSize = 52;
  static const double tabletScrollTopButtonSize = 48;
  static const double mobileScrollTopButtonSize = 44;

  /// Arrow glyph size inside the button.
  static const double scrollTopIconSize = 24;
  static const double tabletScrollTopIconSize = 22;
  static const double mobileScrollTopIconSize = 20;

  /// Inset from the bottom-right corner of the viewport.
  static const double scrollTopButtonInset = space2XL;
  static const double tabletScrollTopButtonInset = spaceXL;
  static const double mobileScrollTopButtonInset = spaceLG;

  /// How far the page must be scrolled before the button fades in.
  static const double scrollTopRevealOffset = 320;

  /// How far the button lifts off the page while hovered.
  static const double scrollTopHoverLift = 3;
}
