import 'package:flutter/widgets.dart';

/// The syntactic roles the faux Dart snippet in the about illustration needs.
///
/// Keeping the snippet described as tokens (rather than pre-colored spans) lets
/// the widget layer own the palette, so retheming never means editing content.
enum CodeTokenKind {
  keyword,
  type,
  string,
  annotation,
  punctuation,
  comment,
  plain,
}

/// One contiguous run of characters in the snippet, tagged with its role.
@immutable
class CodeToken {
  const CodeToken(this.text, [this.kind = CodeTokenKind.plain]);

  final String text;
  final CodeTokenKind kind;

  /// Convenience constructors so the snippet reads almost like real code.
  const CodeToken.keyword(this.text) : kind = CodeTokenKind.keyword;
  const CodeToken.type(this.text) : kind = CodeTokenKind.type;
  const CodeToken.string(this.text) : kind = CodeTokenKind.string;
  const CodeToken.annotation(this.text) : kind = CodeTokenKind.annotation;
  const CodeToken.punctuation(this.text) : kind = CodeTokenKind.punctuation;
  const CodeToken.comment(this.text) : kind = CodeTokenKind.comment;
}

/// A single rendered line of the snippet. An empty token list renders as a
/// blank line, which keeps the snippet's vertical rhythm intact.
typedef CodeLine = List<CodeToken>;
