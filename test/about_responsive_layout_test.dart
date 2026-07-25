import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/widgets/about/Tablet/tablet_about_section.dart';
import 'package:portfolio/widgets/about/desktop/about_section.dart';
import 'package:portfolio/widgets/about/mobile/mobile_about_section.dart';

/// The about section packs a fixed-width code window, a 2-up strengths grid and
/// a three-column stat strip into one column, so it is the section most likely
/// to overflow when a breakpoint moves. Render each variant across its whole
/// width range and fail on any layout exception.
Future<void> _pumpAt(WidgetTester tester, double width, Widget child) async {
  tester.view.physicalSize = Size(width, 4000);
  tester.view.devicePixelRatio = 1.0;
  addTearDown(tester.view.reset);

  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(body: SingleChildScrollView(child: child)),
    ),
  );
  // Let the staggered entrance animations settle.
  await tester.pump(const Duration(seconds: 2));
}

void main() {
  // Widths span each breakpoint band from MainScreen, edges included.
  const mobileWidths = [320.0, 360.0, 390.0, 430.0, 767.0];
  const tabletWidths = [768.0, 860.0, 1024.0, 1099.0];
  const desktopWidths = [1100.0, 1280.0, 1920.0];

  for (final width in mobileWidths) {
    testWidgets('MobileAboutSection lays out at ${width}px', (tester) async {
      await _pumpAt(
        tester,
        width,
        MobileAboutSection(onViewProjects: () {}, onDownloadCv: () {}),
      );
      expect(tester.takeException(), isNull);
    });
  }

  for (final width in tabletWidths) {
    testWidgets('TabletAboutSection lays out at ${width}px', (tester) async {
      await _pumpAt(
        tester,
        width,
        TabletAboutSection(onViewProjects: () {}, onDownloadCv: () {}),
      );
      expect(tester.takeException(), isNull);
    });
  }

  for (final width in desktopWidths) {
    testWidgets('AboutSection lays out at ${width}px', (tester) async {
      await _pumpAt(
        tester,
        width,
        AboutSection(onViewProjects: () {}, onDownloadCv: () {}),
      );
      expect(tester.takeException(), isNull);
    });
  }
}
