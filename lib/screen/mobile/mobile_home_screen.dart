import 'package:flutter/material.dart';
import 'package:portfolio/models/nav_item.dart';
import 'package:portfolio/utils/app_color.dart';
import 'package:portfolio/utils/app_dimensions.dart';
import 'package:portfolio/utils/app_strings.dart';
import 'package:portfolio/widgets/background/animated_background.dart';
import 'package:portfolio/widgets/hero/mobile/mobile_hero_section.dart';
import 'package:portfolio/widgets/navbar/mobile/mobile_drawer.dart';
import 'package:portfolio/widgets/navbar/mobile/mobile_navbar.dart';
import 'package:url_launcher/url_launcher.dart';

class MobileHomeScreen extends StatefulWidget {
  const MobileHomeScreen({super.key});

  @override
  State<MobileHomeScreen> createState() => _MobileHomeScreenState();
}

class _MobileHomeScreenState extends State<MobileHomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  /// Mirrors the drawer state so the nav bar can morph its icon into a cross.
  bool _isDrawerOpen = false;

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
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.scaffoldBackground,
      // Dim the page with the brand navy instead of Material's flat black.
      drawerScrimColor: AppColors.scaffoldBackground.withValues(alpha: 0.7),
      onEndDrawerChanged: (isOpen) => setState(() => _isDrawerOpen = isOpen),
      endDrawer: MobileDrawer(
        activeAnchor: 'home',
        onNavItemTap: _onNavItemTap,
        onHireMe: _onHireMe,
        onOpenSocial: _openUrl,
      ),
      body: Stack(
        children: [
          const AnimatedBackground(),
          SafeArea(
            child: Column(
              children: [
                MobileNavbar(
                  isDrawerOpen: _isDrawerOpen,
                  onMenuTap: _toggleDrawer,
                  onLogoTap: () {},
                ),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: constraints.maxHeight,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: AppDimensions.spaceMD,
                            ),
                            child: Center(
                              child: MobileHeroSection(
                                onHireMe: _onHireMe,
                                onDownloadCv: _onDownloadCv,
                                onOpenSocial: _openUrl,
                                profileImage: const AssetImage(
                                  'assets/images/owais_profile.png',
                                ),
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
        ],
      ),
    );
  }
}
