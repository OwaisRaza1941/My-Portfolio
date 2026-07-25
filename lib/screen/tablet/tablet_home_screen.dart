import 'package:flutter/material.dart';
import 'package:portfolio/models/nav_item.dart';
import 'package:portfolio/utils/app_color.dart';
import 'package:portfolio/utils/app_dimensions.dart';
import 'package:portfolio/utils/app_strings.dart';
import 'package:portfolio/widgets/background/animated_background.dart';
import 'package:portfolio/widgets/hero/desktop/hero_section.dart';
import 'package:portfolio/widgets/navbar/tablet/tablet_navbar.dart';
import 'package:url_launcher/url_launcher.dart';

class TabletHomeScreen extends StatelessWidget {
  const TabletHomeScreen({super.key});

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
                TabletNavbar(
                  onNavItemTap: _onNavItemTap,
                  onHireMe: _onHireMe,
                  onLogoTap: _onHireMe,
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
