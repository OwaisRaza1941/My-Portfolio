import 'package:flutter/material.dart';
import 'package:portfolio/widgets/about/desktop/about_section.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../models/nav_item.dart';
import '../../utils/app_color.dart';
import '../../utils/app_dimensions.dart';
import '../../utils/app_strings.dart';
import '../../widgets/background/animated_background.dart';
import '../../widgets/common/scroll_to_top_button.dart';
import '../../widgets/hero/desktop/hero_section.dart';
import '../../widgets/navbar/desktop/desktop_navbar.dart';
import '../../widgets/services/desktop/services_section.dart';
import '../../widgets/skills/desktop/skills_section.dart';

/// The desktop home screen: a fixed transparent navbar over a premium animated
/// background, with the hero section centered in the remaining viewport.
///
/// It owns the page-level actions (opening links, contacting, downloading the
/// CV) and passes them down to the presentational section widgets.
class DesktopHomeScreen extends StatefulWidget {
  const DesktopHomeScreen({super.key});

  @override
  State<DesktopHomeScreen> createState() => _DesktopHomeScreenState();
}

class _DesktopHomeScreenState extends State<DesktopHomeScreen> {
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
                        controller: _scrollController,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: constraints.maxHeight,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: AppDimensions.space2XL,
                            ),
                            child: Center(
                              child: Column(
                                children: [
                                  HeroSection(
                                    onHireMe: _onHireMe,
                                    onDownloadCv: _onDownloadCv,
                                    onOpenSocial: _openUrl,
                                    profileImage: AssetImage(
                                      'assets/images/owais_profile.png',
                                    ),
                                  ),

                                  AboutSection(
                                    onViewProjects: () {},
                                    onDownloadCv: _onDownloadCv,
                                  ),

                                  ServicesSection(onContact: _onHireMe),

                                  const SkillsSection(),
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
          ScrollToTopButton(controller: _scrollController),
        ],
      ),
    );
  }
}
