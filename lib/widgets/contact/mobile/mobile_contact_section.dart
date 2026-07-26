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

/// The contact section on phones: the same header, info column and form as
/// desktop, dropped to a single full-bleed column on the mobile measure.
///
/// The info column centers its copy and its social row so the whole section
/// reads down the middle of the screen, matching how the mobile hero and about
/// sections close. The form's name/email pair splits onto two rows on its own,
/// since the phone column sits well below
/// [AppDimensions.contactFieldRowBreakpoint].
///
/// Only the type scale, the tile and form padding, the glyph square and the
/// message box height are stepped down; everything else comes from the desktop
/// widgets unchanged.
class MobileContactSection extends StatelessWidget {
  const MobileContactSection({
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
          maxWidth: AppDimensions.mobileContactMaxWidth,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.mobileContactHorizontalPadding,
            vertical: AppDimensions.mobileContactSectionVerticalPadding,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Center(
                child: ContactHeader(
                  titleFontSize: AppDimensions.mobileAboutTitleFontSize,
                  subtitleFontSize: AppDimensions.mobileAboutSubtitleFontSize,
                  maxWidth: AppDimensions.mobileContactMaxWidth,
                ),
              ),
              const SizedBox(
                height: AppDimensions.mobileContactHeaderBottomGap,
              ),

              FadeSlideIn(
                delay: AppDurations.stagger * _headerSteps,
                child: ContactInfoPanel(
                  details: ContactSection.details,
                  onOpenUrl: onOpenUrl,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  textAlign: TextAlign.center,
                  headlineFontSize:
                      AppDimensions.mobileContactInfoHeadlineFontSize,
                  bodyFontSize: AppDimensions.mobileContactInfoBodyFontSize,
                  tileGap: AppDimensions.mobileContactInfoTileGap,
                  tileBuilder: (detail) => ContactInfoTile(
                    detail: detail,
                    onOpenUrl: onOpenUrl,
                    padding: AppDimensions.mobileContactInfoTilePadding,
                    iconBoxSize: AppDimensions.mobileContactInfoIconBoxSize,
                    iconSize: AppDimensions.mobileContactInfoIconSize,
                    labelFontSize: AppDimensions.mobileContactInfoLabelFontSize,
                    valueFontSize: AppDimensions.mobileContactInfoValueFontSize,
                  ),
                ),
              ),
              const SizedBox(height: AppDimensions.mobileContactColumnGap),

              FadeSlideIn(
                delay: AppDurations.stagger * (_headerSteps + 1),
                child: ContactForm(
                  onSend: onSendMessage,
                  padding: AppDimensions.mobileContactFormPadding,
                  titleFontSize: AppDimensions.mobileContactFormTitleFontSize,
                  labelFontSize: AppDimensions.mobileContactFieldLabelFontSize,
                  fontSize: AppDimensions.mobileContactFieldFontSize,
                  buttonHeight: AppDimensions.mobileButtonHeight,
                  messageLines: AppDimensions.mobileContactMessageLines,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
