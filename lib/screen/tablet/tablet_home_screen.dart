import 'package:flutter/material.dart';
import 'package:portfolio/models/nav_item.dart';
import 'package:portfolio/utils/app_color.dart';
import 'package:portfolio/utils/app_dimensions.dart';
import 'package:portfolio/utils/app_strings.dart';
import 'package:portfolio/widgets/about/Tablet/tablet_about_section.dart';
import 'package:portfolio/widgets/background/animated_background.dart';
import 'package:portfolio/widgets/common/scroll_to_top_button.dart';
import 'package:portfolio/widgets/hero/tablet/tablet_hero_section.dart';
import 'package:portfolio/widgets/navbar/mobile/mobile_drawer.dart';
import 'package:portfolio/widgets/navbar/tablet/tablet_navbar.dart';
import 'package:portfolio/widgets/services/tablet/tablet_services_section.dart';
import 'package:portfolio/widgets/skills/tablet/tablet_skills_section.dart';
import 'package:url_launcher/url_launcher.dart';

/// The tablet home screen: the desktop composition on the tablet measure, with
/// the nav bar collapsing into a slide-in drawer once the inline links stop
/// fitting (below [TabletNavbar.compactBreakpoint]).
class TabletHomeScreen extends StatefulWidget {
  const TabletHomeScreen({super.key});

  @override
  State<TabletHomeScreen> createState() => _TabletHomeScreenState();
}

class _TabletHomeScreenState extends State<TabletHomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  /// Mirrors the drawer state so the nav bar can morph its icon into a cross.
  bool _isDrawerOpen = false;

  /// Drives the page scroll view so the floating "back to top" button can
  /// watch the offset and animate back to the hero.
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  /// Opens [url] in a new tab, silently ignoring failures (e.g. placeholder
  /// links that aren't wired up yet).
  Future<void> _openUrl(String url) async {
    final uri = Uri.tryParse(url);
    if (uri == null) return;
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  void _onHireMe() => _openUrl(AppStrings.emailUrl);

  void _onDownloadCv() {
    // Wire this to the real CV asset/URL when available.
    _openUrl(AppStrings.downloadCvUrl);
  }

  void _onNavItemTap(NavItem item) {
    // Section scrolling will be wired up as more sections are added.
  }

  /// Opens or closes the end drawer from the nav bar toggle.
  void _toggleDrawer() {
    final scaffold = _scaffoldKey.currentState;
    if (scaffold == null) return;
    scaffold.isEndDrawerOpen
        ? scaffold.closeEndDrawer()
        : scaffold.openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    // Only the compact tablet width collapses into the drawer; above it the
    // links live inline in the bar, so no drawer is attached at all.
    final bool isCompact =
        MediaQuery.sizeOf(context).width < TabletNavbar.compactBreakpoint;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.scaffoldBackground,
      // Dim the page with the brand navy instead of Material's flat black.
      drawerScrimColor: AppColors.scaffoldBackground.withValues(alpha: 0.7),
      onEndDrawerChanged: (isOpen) => setState(() => _isDrawerOpen = isOpen),
      endDrawer: isCompact
          ? MobileDrawer(
              activeAnchor: 'home',
              onNavItemTap: _onNavItemTap,
              onHireMe: _onHireMe,
              onOpenSocial: _openUrl,
            )
          : null,
      body: Stack(
        children: [
          const AnimatedBackground(),
          SafeArea(
            child: Column(
              children: [
                TabletNavbar(
                  activeAnchor: 'home',
                  isDrawerOpen: _isDrawerOpen,
                  onNavItemTap: _onNavItemTap,
                  onHireMe: _onHireMe,
                  onLogoTap: () {},
                  onMenuTap: _toggleDrawer,
                ),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return SingleChildScrollView(
                        controller: _scrollController,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: constraints.maxHeight,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: AppDimensions.spaceXL,
                            ),
                            child: Center(
                              child: Column(
                                children: [
                                  TabletHeroSection(
                                    onHireMe: _onHireMe,
                                    onDownloadCv: _onDownloadCv,
                                    onOpenSocial: _openUrl,
                                    profileImage: const AssetImage(
                                      'assets/images/owais_profile.png',
                                    ),
                                  ),
                                  TabletAboutSection(
                                    onViewProjects: () {},
                                    onDownloadCv: _onDownloadCv,
                                  ),
                                  const TabletSkillsSection(),
                                  TabletServicesSection(
                                    onContact: _onHireMe,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          ScrollToTopButton(
            controller: _scrollController,
            size: AppDimensions.tabletScrollTopButtonSize,
            iconSize: AppDimensions.tabletScrollTopIconSize,
            inset: AppDimensions.tabletScrollTopButtonInset,
          ),
        ],
      ),
    );
  }
}
