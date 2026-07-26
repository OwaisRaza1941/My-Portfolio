import 'package:flutter/material.dart';

import '../../../models/contact_detail.dart';
import '../../../models/contact_message.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/app_durations.dart';
import '../../../utils/app_strings.dart';
import '../../common/fade_slide_in.dart';
import 'contact_form.dart';
import 'contact_header.dart';
import 'contact_info_panel.dart';
import 'contact_info_tile.dart';

/// The full desktop contact section: a centered header over the direct contact
/// details on the left and the message form on the right.
///
/// ```
///                       📬 GET IN TOUCH
///               Let's Build Something Together
///          Have a project, a role, or just a question?…
///
///   Contact Information          ┌──────────────────────┐
///   [ ✉  Email             ]     │ Send a Message       │
///   [ 📍 Location          ]     │ [Name  ] [Email    ] │
///   [ ⏱  Response Time     ]     │ [Subject           ] │
///   FIND ME ONLINE               │ [Message           ] │
///   ( ) ( ) ( ) ( )              │ (Send Message)       │
///                                └──────────────────────┘
/// ```
///
/// Purely presentational, like the other sections — the copy lives in
/// [AppStrings], the layout constants in [AppDimensions], and both opening a
/// link and delivering a message come down from the owning screen.
class ContactSection extends StatelessWidget {
  const ContactSection({
    super.key,
    required this.onOpenUrl,
    required this.onSendMessage,
  });

  /// Opens a contact detail or social profile.
  final ValueChanged<String> onOpenUrl;

  /// Receives the finished message once the form validates.
  final ValueChanged<ContactMessage> onSendMessage;

  /// The direct channels, in reading order. Only the email carries a URL — the
  /// rest are context, not links.
  static const List<ContactDetail> details = [
    ContactDetail(
      icon: Icons.mail_outline_rounded,
      label: AppStrings.contactEmailLabel,
      value: AppStrings.contactEmailValue,
      url: AppStrings.emailUrl,
    ),
    ContactDetail(
      icon: Icons.place_outlined,
      label: AppStrings.contactLocationLabel,
      value: AppStrings.contactLocationValue,
    ),
    ContactDetail(
      icon: Icons.schedule_rounded,
      label: AppStrings.contactResponseLabel,
      value: AppStrings.contactResponseValue,
    ),
    ContactDetail(
      icon: Icons.work_outline_rounded,
      label: AppStrings.contactFreelanceLabel,
      value: AppStrings.contactFreelanceValue,
    ),
  ];

  /// How many stagger steps the header consumes before the body enters.
  static const int _headerSteps = 4;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: AppDimensions.maxContentWidth,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.pageHorizontalPadding,
            vertical: AppDimensions.contactSectionVerticalPadding,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Center(child: ContactHeader()),
              const SizedBox(height: AppDimensions.contactHeaderBottomGap),

              LayoutBuilder(
                builder: (context, constraints) {
                  final isStacked =
                      constraints.maxWidth <
                      AppDimensions.contactStackBreakpoint;

                  final info = FadeSlideIn(
                    delay: AppDurations.stagger * _headerSteps,
                    child: ContactInfoPanel(
                      details: details,
                      onOpenUrl: onOpenUrl,
                      crossAxisAlignment: isStacked
                          ? CrossAxisAlignment.center
                          : CrossAxisAlignment.start,
                      textAlign: isStacked
                          ? TextAlign.center
                          : TextAlign.start,
                      tileBuilder: (detail) => ContactInfoTile(
                        detail: detail,
                        onOpenUrl: onOpenUrl,
                      ),
                    ),
                  );

                  final form = FadeSlideIn(
                    delay: AppDurations.stagger * (_headerSteps + 1),
                    child: ContactForm(onSend: onSendMessage),
                  );

                  if (isStacked) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        info,
                        const SizedBox(height: AppDimensions.contactColumnGap),
                        form,
                      ],
                    );
                  }

                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: AppDimensions.contactInfoFlex,
                        child: info,
                      ),
                      const SizedBox(width: AppDimensions.contactColumnGap),
                      Expanded(
                        flex: AppDimensions.contactFormFlex,
                        child: form,
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
