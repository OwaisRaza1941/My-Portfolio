import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/screen/desktop/desktop_about_screen.dart';

/// Temporary verification harness: pumps the about screen at several desktop
/// widths and fails on any layout overflow or paint exception.
void main() {
  for (final size in const [
    Size(1920, 1080),
    Size(1440, 900),
    Size(1280, 800),
    Size(1100, 800),
  ]) {
    testWidgets('renders at $size without overflow', (tester) async {
      tester.view.physicalSize = size;
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(const MaterialApp(home: DesktopAboutScreen()));
      await tester.pump(const Duration(seconds: 2));

      expect(tester.takeException(), isNull);
    });
  }
}
