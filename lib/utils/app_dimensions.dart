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

  /// Vertical rhythm between two showcase rows.
  static const double projectsRowGap = space4XL;

  /// Gap between the device preview and the copy beside it.
  static const double projectsColumnGap = space3XL;

  /// Below this section width the rows stop alternating and stack the preview
  /// above the copy — the copy column would otherwise fall under ~320pt.
  static const double projectsStackBreakpoint = 860;

  // ===========================
  // Project Preview (device frame)
  // ===========================

  /// Width of the phone frame. The screenshots are ~860x1825, so this keeps the
  /// frame around 640pt tall — tall enough to read, short enough that the copy
  /// beside it still centers naturally.
  static const double projectPreviewWidth = 292;

  /// Width / height of the framed screenshot, matching the source captures.
  static const double projectPreviewAspectRatio = 0.475;

  /// Outer radius of the phone frame, and the bezel thickness inside it.
  static const double projectPreviewFrameRadius = 36;
  static const double projectPreviewBezel = 10;

  /// Width of the speaker notch drawn across the top of the frame.
  static const double projectPreviewNotchWidth = 92;
  static const double projectPreviewNotchHeight = 20;

  /// How far a hovered preview lifts off the page.
  static const double projectPreviewHoverLift = 10;

  // ===========================
  // Project Content Column
  // ===========================

  /// Width cap for the copy beside the preview, so the paragraph keeps a
  /// comfortable measure on ultra-wide monitors.
  static const double projectContentMaxWidth = 560;

  static const double projectIndexFontSize = 13;
  static const double projectTitleFontSize = 30;
  static const double projectBodyFontSize = 15;
  static const double projectFeatureFontSize = 13.5;
  static const double projectChipFontSize = 12.5;

  /// Space between the category pill row and the project title.
  static const double projectCategoryGap = spaceMD;

  /// Space between blocks inside the copy column.
  static const double projectContentGap = spaceLG;

  /// Gap between the two action buttons.
  static const double projectActionGap = spaceMD;

  /// Height of the action buttons on a showcase row — a notch under the hero
  /// scale, since these repeat four times down the page.
  static const double projectActionButtonHeight = 46;
  static const double projectActionFontSize = 14.5;

  /// Space between the last showcase row and the closing GitHub panel.
  static const double projectsFooterTopGap = space3XL;

  static const double projectsFooterPadding = space2XL - 8;
  static const double projectsFooterTitleFontSize = 24;
  static const double projectsFooterBodyFontSize = 14.5;

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

  /// Vertical rhythm between two showcase rows.
  static const double tabletProjectsRowGap = space3XL;

  /// Gap between the screenshot and the copy beside it.
  static const double tabletProjectsColumnGap = space2XL;

  /// Below this column width the tablet rows stack the screenshot above the
  /// copy instead of squeezing the paragraph.
  static const double tabletProjectsStackBreakpoint = 640;

  /// Screenshot width on tablets — a step down from desktop so the copy column
  /// keeps a readable measure beside it.
  static const double tabletProjectPreviewWidth = 240;

  static const double tabletProjectIndexFontSize = 12;
  static const double tabletProjectTitleFontSize = 25;
  static const double tabletProjectBodyFontSize = 14;
  static const double tabletProjectFeatureFontSize = 12.5;
  static const double tabletProjectChipFontSize = 12;

  static const double tabletProjectActionButtonHeight = 44;
  static const double tabletProjectActionFontSize = 13.5;

  static const double tabletProjectsFooterTopGap = space2XL;
  static const double tabletProjectsFooterPadding = spaceXL;
  static const double tabletProjectsFooterTitleFontSize = 21;
  static const double tabletProjectsFooterBodyFontSize = 13.5;

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

  /// Vertical rhythm between two stacked project cards.
  static const double mobileProjectsRowGap = space2XL;

  /// Gap between the screenshot and the copy under it.
  static const double mobileProjectsColumnGap = spaceXL;

  /// Screenshot width on phones. The captures are portrait, so anything wider
  /// pushes the copy a full screen down the page.
  static const double mobileProjectPreviewWidth = 210;

  static const double mobileProjectIndexFontSize = 11.5;
  static const double mobileProjectTitleFontSize = 22;
  static const double mobileProjectBodyFontSize = 13.5;
  static const double mobileProjectFeatureFontSize = 12;
  static const double mobileProjectChipFontSize = 11.5;

  static const double mobileProjectActionButtonHeight = 42;
  static const double mobileProjectActionFontSize = 13;

  static const double mobileProjectsFooterTopGap = spaceXL;
  static const double mobileProjectsFooterPadding = spaceLG;
  static const double mobileProjectsFooterTitleFontSize = 19;
  static const double mobileProjectsFooterBodyFontSize = 13;

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
