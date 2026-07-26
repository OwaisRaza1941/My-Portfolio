import 'package:flutter/widgets.dart';

/// The payload the contact form hands back once it validates.
///
/// The form itself has no idea how a message is delivered — the owning screen
/// decides whether that means a mailto link, an API call, or something else.
@immutable
class ContactMessage {
  const ContactMessage({
    required this.name,
    required this.email,
    required this.subject,
    required this.body,
  });

  final String name;
  final String email;
  final String subject;
  final String body;
}
