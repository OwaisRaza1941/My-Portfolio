import 'package:flutter/material.dart';

import '../../../models/contact_message.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/app_durations.dart';
import '../../common/fade_slide_in.dart';
import '../desktop/contact_form.dart';
import '../desktop/contact_header.dart';
import '../desktop/contact_info_panel.dart';
import '../desktop/contact_info_tile.dart';
import '../desktop/contact_section.dart';

/// The contact section on tablets: the same header, info column and form as
/// desktop, stacked into one column on the tablet measure.
///
/// ```
///                  📬 GET IN TOUCH
///            Let's Build Something Together
///        Have a project, a role, or just a question?…
///
///              Contact Information
///        [ ✉  Email                          ]
///        [ 📍 Location                       ]
///        FIND ME ONLINE   ( ) ( ) ( ) ( )
///
///        ┌────────────────────────────────────┐
///        │ Send a Message                     │
///        │ [Name        ] [Email             ]│
///        │ [Subject                          ]│
///        └────────────────────────────────────┘
/// ```
///
/// The 700pt column sits below [AppDimensions.contactStackBreakpoint], so the
/// desktop section would stack here anyway — this layout mainly steps the type
/// scale and the tile padding down with it, and keeps the info column left
/// aligned rather than centered, since the tablet measure is wide enough for
/// the tiles to read as a list.
///
/// Purely presentational, like the desktop section — the details list stays in
/// [ContactSection] and both opening a link and delivering a message come down
/// from the owning screen.
class TabletContactSection extends StatelessWidget {
  const TabletContactSection({
    super.key,
    required this.onOpenUrl,
    required this.onSendMessage,
  });

  /// Opens a contact detail or social profile.
  final ValueChanged<String> onOpenUrl;

  /// Receives the finished message once the form validates.
  final ValueChanged<ContactMessage> onSendMessage;

  /// How many stagger steps the header consumes before the body enters.
  static const int _headerSteps = 4;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: AppDimensions.tabletContactMaxWidth,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.tabletHorizontalPadding,
            vertical: AppDimensions.tabletContactSectionVerticalPadding,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Center(
                child: ContactHeader(
                  titleFontSize: AppDimensions.tabletAboutTitleFontSize,
                  subtitleFontSize: AppDimensions.tabletAboutSubtitleFontSize,
                  maxWidth: AppDimensions.tabletContactHeaderMaxWidth,
                ),
              ),
              const SizedBox(
                height: AppDimensions.tabletContactHeaderBottomGap,
              ),

              FadeSlideIn(
                delay: AppDurations.stagger * _headerSteps,
                child: ContactInfoPanel(
                  details: ContactSection.details,
                  onOpenUrl: onOpenUrl,
                  headlineFontSize:
                      AppDimensions.tabletContactInfoHeadlineFontSize,
                  bodyFontSize: AppDimensions.tabletContactInfoBodyFontSize,
                  tileGap: AppDimensions.tabletContactInfoTileGap,
                  tileBuilder: (detail) => ContactInfoTile(
                    detail: detail,
                    onOpenUrl: onOpenUrl,
                    padding: AppDimensions.tabletContactInfoTilePadding,
                    iconBoxSize: AppDimensions.tabletContactInfoIconBoxSize,
                    iconSize: AppDimensions.tabletContactInfoIconSize,
                    labelFontSize: AppDimensions.tabletContactInfoLabelFontSize,
                    valueFontSize: AppDimensions.tabletContactInfoValueFontSize,
                  ),
                ),
              ),
              const SizedBox(height: AppDimensions.tabletContactColumnGap),

              FadeSlideIn(
                delay: AppDurations.stagger * (_headerSteps + 1),
                child: ContactForm(
                  onSend: onSendMessage,
                  padding: AppDimensions.tabletContactFormPadding,
                  titleFontSize: AppDimensions.tabletContactFormTitleFontSize,
                  labelFontSize: AppDimensions.tabletContactFieldLabelFontSize,
                  fontSize: AppDimensions.tabletContactFieldFontSize,
                  buttonHeight: AppDimensions.tabletButtonHeight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
