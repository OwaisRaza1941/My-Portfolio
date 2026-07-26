import 'package:flutter/material.dart';
import 'package:portfolio/widgets/about/desktop/about_section.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../models/contact_message.dart';
import '../../utils/app_color.dart';
import '../../utils/app_dimensions.dart';
import '../../utils/app_strings.dart';
import '../../utils/section_navigation.dart';
import '../../widgets/background/animated_background.dart';
import '../../widgets/common/scroll_to_top_button.dart';
import '../../widgets/contact/desktop/contact_section.dart';
import '../../widgets/hero/desktop/hero_section.dart';
import '../../widgets/navbar/desktop/desktop_navbar.dart';
import '../../widgets/projects/desktop/projects_section.dart';
import '../../widgets/services/desktop/services_section.dart';
import '../../widgets/skills/desktop/skills_section.dart';

/// Desktop Screen Layout
class DesktopHomeScreen extends StatefulWidget {
  const DesktopHomeScreen({super.key});

  @override
  State<DesktopHomeScreen> createState() => _DesktopHomeScreenState();
}

class _DesktopHomeScreenState extends State<DesktopHomeScreen>
    with SectionNavigation {
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
                  activeAnchor: activeAnchor,
                  onNavItemTap: onNavItemTap,
                  onHireMe: _onHireMe,
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
                              vertical: AppDimensions.space2XL,
                            ),
                            child: Center(
                              child: Column(
                                children: [
                                  section(
                                    'home',
                                    HeroSection(
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
                                    AboutSection(
                                      onViewProjects: () =>
                                          scrollToAnchor('projects'),
                                      onDownloadCv: _onDownloadCv,
                                    ),
                                  ),

                                  section(
                                    'services',
                                    ServicesSection(onContact: _onHireMe),
                                  ),

                                  section('skills', const SkillsSection()),

                                  section(
                                    'projects',
                                    ProjectsSection(
                                      onOpenUrl: _openUrl,
                                      onBrowseAll: () =>
                                          _openUrl(AppStrings.githubUrl),
                                    ),
                                  ),

                                  section(
                                    'contact',
                                    ContactSection(
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
          ScrollToTopButton(controller: scrollController),
        ],
      ),
    );
  }
}
