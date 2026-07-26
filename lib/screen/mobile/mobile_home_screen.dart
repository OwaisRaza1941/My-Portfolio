import 'package:flutter/material.dart';
import 'package:portfolio/models/contact_message.dart';
import 'package:portfolio/utils/app_color.dart';
import 'package:portfolio/utils/app_dimensions.dart';
import 'package:portfolio/utils/app_strings.dart';
import 'package:portfolio/utils/section_navigation.dart';
import 'package:portfolio/widgets/about/mobile/mobile_about_section.dart';
import 'package:portfolio/widgets/background/animated_background.dart';
import 'package:portfolio/widgets/common/scroll_to_top_button.dart';
import 'package:portfolio/widgets/contact/mobile/mobile_contact_section.dart';
import 'package:portfolio/widgets/hero/mobile/mobile_hero_section.dart';
import 'package:portfolio/widgets/navbar/mobile/mobile_drawer.dart';
import 'package:portfolio/widgets/navbar/mobile/mobile_navbar.dart';
import 'package:portfolio/widgets/projects/mobile/mobile_projects_section.dart';
import 'package:portfolio/widgets/services/mobile/mobile_services_section.dart';
import 'package:portfolio/widgets/skills/mobile/mobile_skills_section.dart';
import 'package:url_launcher/url_launcher.dart';

class MobileHomeScreen extends StatefulWidget {
  const MobileHomeScreen({super.key});

  @override
  State<MobileHomeScreen> createState() => _MobileHomeScreenState();
}

class _MobileHomeScreenState extends State<MobileHomeScreen>
    with SectionNavigation {
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

  /// Hands the contact form's message to the visitor's mail client, pre-filled.
  ///
  /// The address is encoded by hand rather than through [Uri.queryParameters],
  /// which would turn every space into a "+" and leave them literal in the body.
  void _onSendMessage(ContactMessage message) {
    final body = '${message.body}\n\n— ${message.name} (${message.email})';
    final query =
        'subject=${Uri.encodeComponent(message.subject)}'
        '&body=${Uri.encodeComponent(body)}';

    _openUrl('${AppStrings.emailUrl}?$query');
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
        activeAnchor: activeAnchor,
        onNavItemTap: onNavItemTap,
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
                  onLogoTap: () => scrollToAnchor(SectionNavigation.homeAnchor),
                ),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return SingleChildScrollView(
                        controller: scrollController,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: constraints.maxHeight,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: AppDimensions.spaceMD,
                            ),
                            child: Center(
                              child: Column(
                                children: [
                                  section(
                                    'home',
                                    MobileHeroSection(
                                      onHireMe: _onHireMe,
                                      onDownloadCv: _onDownloadCv,
                                      onOpenSocial: _openUrl,
                                      profileImage: const AssetImage(
                                        'assets/images/owais_profile.png',
                                      ),
                                    ),
                                  ),
                                  section(
                                    'about',
                                    MobileAboutSection(
                                      onViewProjects: () =>
                                          scrollToAnchor('projects'),
                                      onDownloadCv: _onDownloadCv,
                                    ),
                                  ),
                                  section(
                                    'skills',
                                    const MobileSkillsSection(),
                                  ),
                                  section(
                                    'services',
                                    MobileServicesSection(
                                      onContact: _onHireMe,
                                    ),
                                  ),
                                  section(
                                    'projects',
                                    MobileProjectsSection(
                                      onOpenUrl: _openUrl,
                                      onBrowseAll: () =>
                                          _openUrl(AppStrings.githubUrl),
                                    ),
                                  ),
                                  section(
                                    'contact',
                                    MobileContactSection(
                                      onOpenUrl: _openUrl,
                                      onSendMessage: _onSendMessage,
                                    ),
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
            controller: scrollController,
            size: AppDimensions.mobileScrollTopButtonSize,
            iconSize: AppDimensions.mobileScrollTopIconSize,
            inset: AppDimensions.mobileScrollTopButtonInset,
          ),
        ],
      ),
    );
  }
}
