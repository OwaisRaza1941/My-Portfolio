import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../models/nav_item.dart';
import '../../utils/app_color.dart';
import '../../utils/app_dimensions.dart';
import '../../utils/app_strings.dart';
import '../../widgets/background/animated_background.dart';
import '../../widgets/hero/desktop/hero_section.dart';
import '../../widgets/navbar/desktop/desktop_navbar.dart';

/// The desktop home screen: a fixed transparent navbar over a premium animated
/// background, with the hero section centered in the remaining viewport.
///
/// It owns the page-level actions (opening links, contacting, downloading the
/// CV) and passes them down to the presentational section widgets.
class DesktopHomeScreen extends StatelessWidget {
  const DesktopHomeScreen({super.key});

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
      backgroundColor: AppColors.scaffoldBackground,
      body: Stack(
        children: [
          const AnimatedBackground(),
          SafeArea(
            child: Column(
              children: [
                DesktopNavbar(
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
                              vertical: AppDimensions.space2XL,
                            ),
                            child: Center(
                              child: HeroSection(
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
