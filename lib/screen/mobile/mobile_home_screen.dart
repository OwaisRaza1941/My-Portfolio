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

class MobileHomeScreen extends StatelessWidget {
  const MobileHomeScreen({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: MobileDrawer(onNavItemTap: _onNavItemTap, onHireMe: _onHireMe),
      backgroundColor: AppColors.scaffoldBackground,
      body: Stack(
        children: [
          const AnimatedBackground(),
          SafeArea(
            child: Column(
              children: [
                MobileNavbar(
                  activeAnchor: 'home',
                  onNavItemTap: _onNavItemTap,
                  onHireMe: _onHireMe,
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
                                profileImage: AssetImage(
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
